require 'rails_helper'
require 'webmock/rspec'
require 'httparty'

describe Github do

  describe "returns the correct quote depends on the github rate limit status" do

    it "attempt to make requtest to github" do

    end

    it "returns github zen quote when under limit" do

    end

    it "returns quote from quote database when over limit" do
      stub = stub_request(:get, "https://api.github.com/zen").with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'})
      api = Github::Client.new
      quote = api.get(ENV['TOKEN'])
      expect(Quote.find_by(quote: quote)).to_not be_nil
    end
  end

end