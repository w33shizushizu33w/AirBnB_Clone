class HomePagesController < ApplicationController
  def home
    @rooms = Room.all
    @room = Room.new
  end

  def about
   @users = User.all
  end

  def contact
  end
end
