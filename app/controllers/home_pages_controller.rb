class HomePagesController < ApplicationController
  def home
    @rooms = Room.all
    @room = Room.new
    @search = Room.ransack(params[:q])
    @rooms = @search.result
  end

  def about
   @users = User.all
  end

  def contact
  end
end
