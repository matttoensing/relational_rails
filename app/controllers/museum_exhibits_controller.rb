class MuseumExhibitsController < ApplicationController
  def index
    @museum = Museum.find(params[:museum_id])
    @exhibits = @museum.exhibits
  end

  def new
    @museum = Museum.find(params[:museum_id])
    @exhibits = Exhibit.new
  end

  def create
    @museum = Museum.find(params[:museum_id])
    exhibit = Exhibit.new(exhibit_params)

    exhibit.save

    redirect_to "/museums/#{@museum.id}/exhibits"
  end

  private

  def exhibit_params
    params.permit(:title, :person_limit, :photos, :flash, :museum_id)
  end
end
