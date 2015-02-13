require 'rails_helper'

RSpec.describe Question, :type => :model do

  describe "question model should be valid" do

    # let(:question) { FactoryGirl.build :question} same as before each, FactoryGirl.attributes_for :question....

    it "title should be present" do
      expect(FactoryGirl.build(:question, title: nil)).to_not be_valid
    end

    it "content should be present" do
      expect(FactoryGirl.build(:question, content: nil)).to_not be_valid
    end

    it "pass validation with valid data" do
      expect(FactoryGirl.create(:question)).to be_valid
    end
  end

end
