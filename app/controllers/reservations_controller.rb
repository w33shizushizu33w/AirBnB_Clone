class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def create   
    room = Room.find(params[:room_id])
    check_in_date = Date.parse(reservation_params[:check_in_date])
    check_out_date = Date.parse(reservation_params[:check_out_date])
    number_of_nights = check_out_date == check_in_date ? 1: (check_out_date - check_in_date).to_i 

    total_computed_price = (number_of_nights * room.price).to_i
    final_params = reservation_params.merge(price: room.price, total_price: total_computed_price)
    @reservation = current_user.reservations.new(final_params)
    if room.user_id == current_user.id
      flash[:alert] = "You cannot book your own room!"
    else
      if @reservation.save
        flash[:notice] = "Booking Saved..!"
      else
        flash[:alert] = "Booking failed.. Try again later."
      end
    end
      redirect_back(fallback_location: root_path)
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :room_id, :check_in_date, :check_out_date,
                                        :price, :total_price)
  end

end
