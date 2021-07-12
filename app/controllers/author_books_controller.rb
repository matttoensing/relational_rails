class AuthorBooksController < ApplicationController
  def index
    if params[:sort]
      @author = Author.find(params[:author_id])
      @books = @author.books.sorts_title_alphabetically
    else
      @author = Author.find(params[:author_id])
      @books = @author.books
    end

    if params.has_key?('pages')
      @author = Author.find(params[:author_id])
      @books = @author.books.books_over_page_length(params[:pages].to_i)
    end
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
