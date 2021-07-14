class ExhibitsController < ApplicationController
  def index
    @exhibits = Exhibit.show_true_photos
  end

  def show
    @exhibit = Exhibit.find(params[:id])
  end

  def edit
    @exhibit = Exhibit.find(params[:id])
  end

  def update
    exhibit = Exhibit.find(params[:id])
    exhibit.update(exhibit_params)

    exhibit.save

    redirect_to "/exhibits/#{exhibit.id}"
  end

  def delete
    exhibit = Exhibit.find(params[:id])
    exhibit.destroy

    redirect_to '/exhibits'
  end

  private

  def exhibit_params
    params.permit(:title, :person_limit, :photos, :flash)
  end
end
