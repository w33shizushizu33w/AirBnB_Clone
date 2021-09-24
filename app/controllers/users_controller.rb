class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
    @room_count = Room.count("*")
  end
end
