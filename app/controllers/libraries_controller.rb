class LibrariesController < ApplicationController
  def index
    if params[:search]
      @libraries = Library.filter_name_by_exact_match(params[:search])
    else
      @libraries = Library.all.order_by_creation_time
    end
  end

  def show
    @library = Library.find(params[:id])
  end

  def new
    @library = Library.new
  end

  def create
    library = Library.create!(library_params)
    library.save
    redirect_to '/libraries'
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    library = Library.find(params[:id])
    library.update(library_params)
    library.save

    redirect_to "/libraries/#{library.id}"
  end

  def delete
    library = Library.find(params[:id])
    library.destroy
    redirect_to "/libraries"
  end

  private

  def library_params
    params.permit(:name, :public, :zip_code)
  end
end
