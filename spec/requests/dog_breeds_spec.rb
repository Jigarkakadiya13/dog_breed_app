require 'rails_helper'

RSpec.describe "DogBreeds", type: :request do
  describe "POST #fetch_image" do
    it "returns a JSON response with image URL for valid breed" do
      allow(HTTParty).to receive(:get).and_return(double(parsed_response: { "message" => "https://imageurl.com" }))
      post '/dog_breeds/fetch_image', params: { breed: "hound" }, as: :json
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response["message"]).to eq("https://imageurl.com")
    end

    it "returns a 404 response for invalid breed" do
      allow(HTTParty).to receive(:get).and_return(double(parsed_response: { "status" => "error" }))
      post '/dog_breeds/fetch_image', params: { breed: "invalid_breed" }, as: :json
      expect(response).to have_http_status(:not_found)
      json_response = JSON.parse(response.body)
      expect(json_response["status"]).to eq("error")
    end
  end
end
