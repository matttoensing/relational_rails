class LibraryMembersController < ApplicationController
  def index
    if params[:sort]
      @library = Library.find(params[:library_id])
      @members = @library.members.sorts_first_name_alphabetically
    else
      @library = Library.find(params[:library_id])
      @members = @library.members
    end

    if params.has_key?(:age)
      @library = Library.find(params[:library_id])
      @members = @library.members.members_over_age(params[:age].to_i)
    end
  end

  def new
    @library = Library.find(params[:library_id])
    @member = Member.new
  end

  def create
    @library = Library.find(params[:library_id])
    member = Member.new(member_params)

    member.save

    redirect_to "/libraries/#{@library.id}/members"
  end

  private

  def member_params
    params.permit(:first_name, :last_name, :age, :late_fees, :library_id)
  end
end
