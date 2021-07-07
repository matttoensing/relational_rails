class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
  end

  def show
    @library = Library.find(params[:id])
  end

  def new
    @library = Library.new
  end

  def create
    library = Library.new(name: params[:library][:name], public: params[:library][:public], zip_code: params[:library][:zip_code])
    # library = Library.new(params.require(:library).permit(:name, :public, :zip_code))
    library.save

    redirect_to '/libraries'
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    library = Library.find(params[:id])
    library.update(name: params[:library][:name], public: params[:library][:public], zip_code: params[:library][:zip_code])
    redirect_to "/libraries/#{library.id}"
  end
end
