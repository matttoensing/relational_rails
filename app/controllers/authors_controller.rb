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
    author = Author.new(name: params[:author][:name], published: params[:author][:published], age: params[:author][:age])

    author.save

    redirect_to '/authors'
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    author.update(params.require(:author).permit(:name, :published, :age)

    redirect_to '/authors'
  end
end
