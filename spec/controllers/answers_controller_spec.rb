require 'rails_helper'

describe AnswersController do

  before :each do
    @question = FactoryGirl.create(:question)
    @answer = FactoryGirl.create(:answer, question: @question)
  end

  describe "POST questions/:question_id/answers" do
    it "successfully create new answer mapped to the desired question" do
      expect {
      post :create, question_id: @answer.question.id, answer: { title: @answer.title, content: @answer.content }
      }.to change{
        Answer.all.count
      }.by(1)
    end
  end

  describe "PATCH questions/:question_id/answers/:answer_id/upvote" do
    it "increases answer vote by 1" do
      expect {
        patch :upvote, {question_id: @question.id, answer_id: @answer.id}
        @answer.reload
      }.to change{
        @answer.votes
      }.by(1)
    end
  end

  describe "PATCH questions/:question_id/answers/:answer_id/downvote" do
    it "decreases answer vote by 1" do
      expect {
        patch :downvote, {question_id: @question.id, answer_id: @answer.id}
        @answer.reload
      }.to change{
        @answer.votes
      }.by(-1)
    end
  end

end