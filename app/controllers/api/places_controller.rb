class Api::PlacesController < ApplicationController
  def index
    address = params[:address]
    modified_address = ""
    i = 0
    address.length.times do 
      if address[i] == " "
        modified_address += "+"
      else
        modified_address += address[i]
      end
      i += 1
    end

    response = HTTP.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{modified_address}&key=#{ENV["GOOGLE_API_KEY"]}")

    @begin_lat = response.parse["results"][0]["geometry"]["location"]["lat"]
    @begin_lng = response.parse["results"][0]["geometry"]["location"]["lng"]

    radius = params[:radius]

    @response = HTTP.headers(:"x-api-key"=> "#{ENV["SYGIC_API_KEY"]}").get("https://api.sygictravelapi.com/1.1/en/places/list?area=#{@begin_lat},#{@begin_lng},#{radius}").parse["data"]["places"]

    render 'index.json.jbuilder'
  end
end