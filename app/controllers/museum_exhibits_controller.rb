class MuseumExhibitsController < ApplicationController
  def index
    museum = Museum.find(params[:museum_id])
    @exhibits = museum.exhibits
  end
end
