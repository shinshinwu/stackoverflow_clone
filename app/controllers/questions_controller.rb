class QuestionsController < ApplicationController
  respond_to :html, :js

  def index
    api = Github::Client.new
    @quote = api.get(ENV['TOKEN'])
    print = ENV['TEST']
    p print
    @question = Question.new
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.paginate(page: params[:page])
    @answer = Answer.new
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        flash[:success] = "Question successfully posted!"
        format.js {}
        format.html { redirect_to @question }
      else
        render 'new'
      end
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:success] = "Question updated"
      redirect_to @question
    else
      render 'edit'
    end
  end

  def upvote
    @question = Question.find(params[:id])
    respond_to do |format|
      @question.upvote
      format.js {}
      format.html { redirect_to @question}
    end
  end

  def downvote
    @question = Question.find(params[:id])
    respond_to do |format|
      @question.downvote
      format.js {}
      format.html { redirect_to @question }
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "Question deleted"
    redirect_to 'index'
  end

  private
    def question_params
      params.require(:question).permit(:title, :content)
    end
end
