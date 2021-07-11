class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
    member.update(member_params)
    member.save

    redirect_to "/members/#{member.id}"
  end

  def delete
    member = Member.find(params[:id])
    member.destroy
    redirect_to "/members"
  end

  private

  def member_params
    params.permit(:first_name, :last_name, :age, :late_fees)
  end
end
