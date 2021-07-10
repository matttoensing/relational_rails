class MuseumExhibitsController < ApplicationController
  def index
    if params[:sort]
      @museum = Museum.find(params[:museum_id])
      @exhibits = @museum.exhibits.sorts_title_alphabetically
    else
      @museum = Museum.find(params[:museum_id])
      @exhibits = @museum.exhibits
    end
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
