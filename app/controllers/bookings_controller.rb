class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  before_action :set_painting, only: [:create]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show; end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.painting = @painting
    @booking.user = current_user

    if @booking.save
      redirect_to painting_path(@painting)
    else
      render :new
    end
  end

  def destroy
    @booking.delete
    redirect_to dashboard_path(current_user)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_painting
    @painting = Painting.find(params[:painting_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
