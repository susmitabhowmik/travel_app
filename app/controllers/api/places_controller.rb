class Api::PlacesController < ApplicationController
  def index
    render 'index.json.html'
  end
end
