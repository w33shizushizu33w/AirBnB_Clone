class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :fetch_room, except: [:new, :create, :index]
  def new
    @room = Room.new
  end

  def index
    @rooms = Room.all
    @room = Room.new
    @search = Room.ransack(params[:q])
    @rooms = @search.result
  end

  def show
    @room = Room.find(params[:id])
    @user = User.find(@room.user_id)
    @image = @room.images
  end

  def listing
  end

  def price
  end

  def description
  end

  def photos
    @image = @room.images
  end

  def amenities
  end

  def location 
  end

  def more_listings
    @rooms = Room.all
    @rooms = Room.paginate(page: params[:page], per_page: 3 )
    @room = Room.new
    @users = User.all
    @user = User.find(params[:id])
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = "Saved Successfully!"
      redirect_to listing_room_path(@room)
    else
      flash[:danger] = "Creating failed."
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      flash[:success] = "Saved successfully!"
    else
      flash[:danger] = "Editing failed."
    end
    if @room.is_active == true
      redirect_to room_path(@room.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    Room.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def room_params
    params.require(:room).permit(:user_id, :listing_name, :summery, :home_type, :room_type, 
                                 :accommodate, :bedroom, :bathroom, :price, :tv, :kitchen, 
                                 :internet, :heating, :air_conditioning, :is_active, :address,
                                 images_attributes: [ :id, :listing_id ])
  end

  def fetch_room
    @room = Room.find(params[:id])
  end
end
