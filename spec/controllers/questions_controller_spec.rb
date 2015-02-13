require 'rails_helper'

describe QuestionsController do

  before :each do
    @question = FactoryGirl.create(:question)
    @answer = FactoryGirl.create(:answer, question: @question)
  end

  # describe "question index page" do

  #   it "assigns questions to Question.all" do
  #     get :index
  #     expect(assigns(:questions)).to eq Question.all
  #   end

  # end

  # test redirect
  # it "redirects to index if successful" do
  #   post blah, params
  #   expect(response).to redirect_to(index_path)
  # end

  describe "POST questions" do
    it "successfully create new questions with valid information" do

      expect {
      post :create, question: { title: @question.title, content: @question.content }
      }.to change{
        Question.all.count
      }.by(1)
    end
  end

  describe "GET questions/:id/edit" do
    it "return success status" do
      get :edit, id: @question
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH questions/:id/edit" do
    it "Update the question with revised contents" do
      patch :update, id: @question, :question => {title: "bacon", content: @question.content}
      @question.reload
      expect(@question.title).to eq("bacon")
    end
  end

  describe "PATCH questions/:id/upvote" do
    it "increases the question votes by 1" do
      expect {
        patch :upvote, id:@question
        @question.reload
      }.to change{
        @question.votes
      }.by(1)
    end
  end

  describe "PATCH questions/:id/downvote" do
    it "decreases the question votes by 1" do
      expect {
        patch :downvote, id:@question
        @question.reload
      }.to change{
        @question.votes
      }.by(-1)
    end
  end

  describe "DELETE questions/:id" do

    it "successfully delete desired question" do
      expect {
        post :destroy, id: @question
      }.to change{
        Question.all.count
      }.by(-1)
    end

    it "delete the answers associated with the question if the question is deleted" do
      expect {
        post :destroy, id: @question
      }.to change{
          Answer.all.count
      }.by(-1)
    end
  end

end
