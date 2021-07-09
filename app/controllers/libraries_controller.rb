class LibrariesController < ApplicationController
  def index
    @libraries = Library.all.order_by_creation_time
  end

  def show
    @library = Library.find(params[:id])
  end

  def new
    # @library = Library.new
  end

  def create
    library = Library.new(library_params)
    if library.save
      redirect_to '/libraries'
    else
      flash[:error] = library.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    library = Library.find(params[:id])
    library.update(name: params[:library][:name], public: params[:library][:public], zip_code: params[:library][:zip_code])
    redirect_to "/libraries/#{library.id}"
  end

  private

  def library_params
    params.permit(:name, :public, :zip_code)
  end
end
