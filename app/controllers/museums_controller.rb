class MuseumsController < ApplicationController
  def index
    @museums = Museum.all.order_by_creation_time
  end

  def show
    @museum = Museum.find(params[:id])
  end

  def new
    @museum = Museum.new
  end

  def create
    museum = Museum.new(museum_params)

    museum.save

    redirect_to '/museums'
  end

  def edit
    @museum = Museum.find(params[:id])
  end

  def update
    museum = Museum.find(params[:id])
    museum.update(museum_params)

    museum.save

    redirect_to "/museums/#{museum.id}"
  end

  private

  def museum_params
    params.permit(:name, :free, :entry_fee)
  end
end
