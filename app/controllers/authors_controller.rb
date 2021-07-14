class AuthorsController < ApplicationController
  def index
    if params.has_key?(:sort)
      @authors = Author.all.order_by_number_of_books
    else
      @authors = Author.all.order_by_creation_time
    end
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

  def delete
    author = Author.find(params[:id])
    author.destroy
    redirect_to '/authors'
  end

  private

  def author_params
    params.permit(:name, :published, :age)
  end
end
