require 'net/http'

class DogBreedsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:fetch_image]
  def fetch_image
    breed = params[:breed]
    response = HTTParty.get("https://dog.ceo/api/breed/#{breed}/images/random")
    render json: response.parsed_response
  end
end
