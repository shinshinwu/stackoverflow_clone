require 'rails_helper'

RSpec.describe Answer, :type => :model do

  describe "answer model should be valid" do

    it "title should be present" do
      expect(FactoryGirl.build(:answer, title: nil)).to_not be_valid
    end

    it "content should be present" do
      expect(FactoryGirl.build(:answer, content: nil)).to_not be_valid
    end

    it "pass validation with valid data" do
      expect(FactoryGirl.create(:answer)).to be_valid
    end
  end
end
