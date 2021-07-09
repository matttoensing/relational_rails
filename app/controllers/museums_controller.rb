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
    museum = Museum.new(name: params[:museum][:name], free: params[:museum][:free], entry_fee: params[:museum][:entry_fee])

    museum.save

    redirect_to '/museums'
  end
end
