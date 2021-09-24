class SearchController < ApplicationController
  def search
    session[:address] = params[:search] #bring text named search
    if session[:address].present? #&& session[:address].empty?
        @rooms = Room.where(is_active: true).near(session[:address], 5, order:'distance')
    else
        @rooms = Room.where(is_active: true)
    end
    unless @rooms.nil?
      @rooms = @rooms.ransack(params[:q])
      @listing_list = @rooms.result(distinct: true).paginate(page: params[:page], per_page: 2) 
    end
  end
end
