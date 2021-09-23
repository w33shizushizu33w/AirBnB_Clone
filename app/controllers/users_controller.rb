class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @room_count = Room.count("*")
  end
end
