class LibraryMembersController < ApplicationController
  def index
    library = Library.find(params[:library_id])
    @members = library.members
  end
end
