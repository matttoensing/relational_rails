class AuthorsController < ApplicationController
  def index
    @authors = Author.all.order_by_creation_time
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    author = Author.new(author_params)

    author.save

    redirect_to '/authors'
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    author.update(author_params)

    author.save

    redirect_to "/authors/#{author.id}"
  end

  private

  def author_params
    params.permit(:name, :published, :age)
  end
end
