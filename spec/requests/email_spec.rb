require 'rails_helper'

RSpec.describe "Email", type: :request do

  context "on a valid post request" do
    before do
      headers = { "ACCEPT" => "application/json" }
      post "/email",
           :params => {:email => {
                   to: "brightwheeltest@mailinator.com",
                   to_name: "Mr. Qadir",
                   from: "info@brightwheel.com",
                   from_name: "Brightwheel",
                   subject: "A Message from Brightwheel",
                   body: "Hi Shazeb, this is an amazing new test"
           }},
           :headers => headers
    end

    it "returns a 200" do
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(200)
    end

  end


  context "when the to email is invalid" do
    before do
      headers = { "ACCEPT" => "application/json" }
      post "/email",
           :params => {:email => {
               to: "not_valid",
               to_name: "Mr. Qadir",
               from: "info@brightwheel.com",
               from_name: "Brightwheel",
               subject: "A Message from Brightwheel",
               body: "Hi Shazeb, this is an amazing new test"
           }},
           :headers => headers
    end

    it "returns a 500" do
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(500)
    end
  end
end

