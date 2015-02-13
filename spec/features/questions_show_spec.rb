require 'rails_helper'

describe "question show page", :js => true do

  before :each do
    @question = FactoryGirl.create(:question)
    @answer1 = FactoryGirl.create(:answer, question: @question)
    @answer2 = FactoryGirl.create(:answer, question: @question)
  end

  # let!(:question)

  # before :each do
  #   visit root_path
  # end

  it "displays all answers related to the question" do
    visit question_path(@question.id)
    expect(page).to have_content(@answer1.title)
    expect(page).to have_content(@answer2.title)
  end

  # it "can create a answer to the question" do
  #   question = FactoryGirl...
  #   fill_in "Title", :with :question =>
  # end
end