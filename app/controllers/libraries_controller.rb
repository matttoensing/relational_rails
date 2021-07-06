class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
  end

  def new
    @library = Library.new
  end

  def create
    library = Library.new(name: params[:library][:name], public: params[:library][:public], zip_code: params[:library][:zip_code])
    library.save

    redirect_to '/libraries'
  end
end
