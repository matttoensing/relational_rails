class MuseumsController < ApplicationController
  def index
    @museums = Museum.all.order_by_creation_time
  end

  def show
    @museum = Museum.find(params[:id])
  end
end
