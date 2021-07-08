
class AuthorsController < ApplicationController
  def index
    @authors = Author.all.order_by_creation_time
  end

  def show
    @author = Author.find(params[:id])
  end
end
