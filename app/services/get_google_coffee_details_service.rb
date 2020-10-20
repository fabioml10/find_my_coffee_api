require 'rest-client'
require 'json'

class GetGoogleCoffeeDetailsService
  def initialize(google_place_id)
    @google_place_id = google_place_id
  end

  def call
    begin
      base_url = "https://maps.googleapis.com/maps/api/place/details/json?"
      place_id = "place_id=#{@google_place_id}"
      key = "key=#{ENV["GOOGLE_PLACE_API_KEY"]}"
      url = "#{base_url}#{place_id}&#{key}"

      response = RestClient.get url
      JSON.parse(response.body)
    rescue RestClient::ExecptionResponse => e
      e.response
    end
  end
end