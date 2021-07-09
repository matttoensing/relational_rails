class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @books = @author.books
  end

  def new
    @author = Author.find(params[:author_id])
    @book = Book.new
  end

  def create
    @author = Author.find(params[:author_id])
    book = Book.new(book_params)

    book.save

    redirect_to "/authors/#{@author.id}/books"
  end

  private

  def book_params
    params.permit(:title, :pages, :awards, :author_id)
  end
end
