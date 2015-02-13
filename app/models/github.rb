require 'quote'

module Github

  class Client
    include HTTParty
    base_uri "https://api.github.com"

    def get(access_token)
      headers = {"User-Agent" => "shinshinwu"}
      response = self.class.get("/zen", :query => { :access_token => access_token })
      if response.code == 403
        return Quote.find(rand(1..Quote.all.count)).quote
      else
        return response
      end
    end
  end

end