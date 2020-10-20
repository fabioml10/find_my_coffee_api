require 'rest-client'
require 'json'

class GetGoogleCoffeeListService
  def initialize(latitude,longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def call
    begin
      base_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?"
      query = "query=coffee+shops"
      location = "location=#{@latitude},#{@longitude}"
      radius = "adius=5000"
      key = "key=#{ENV["GOOGLE_PLACE_API_KEY"]}"
      url = "#{base_url}#{query}&#{location}&#{radius}&#{key}"

      response = RestClient.get url
      JSON.parse(response.body)
    rescue RestClient::ExecptionResponse => e
      e.response
    end
  end
end