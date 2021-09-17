class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
    @rooms = Room.all
    @room = Room.new
  end
end
