class AnswersController < ApplicationController
  respond_to :html, :js

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @question.answers << @answer
    respond_to do |format|
      if @answer.save
        flash[:success] = "Answer successfully posted!"
        format.js {}
        format.html { redirect_to question_path(params[:question_id]) }
      else
        redirect_to question_path(params[:question_id])
      end
    end
  end

  def upvote
    @answer = Answer.find(params[:answer_id])
    respond_to do |format|
      @answer.upvote
      format.js {}
      format.html { redirect_to question_path(params[:question_id]) }
    end
  end

  def downvote
    @answer = Answer.find(params[:answer_id])
    respond_to do |format|
      @answer.downvote
      format.js {}
      format.html { redirect_to question_path(params[:question_id]) }
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:title, :content)
    end
end