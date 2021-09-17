class HomePagesController < ApplicationController
  def home
    @rooms = Room.all
    @room = Room.new
  end

  def about
  end

  def contact
  end
end
