class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy, :update]
  before_action :set_painting, only: [:create]

  def index
    @bookings = policy_scope(Booking) # .oder(:title) oder preis bzw. filter logic
    # .where(user_id: current_user.id) -> Delete ??
  end

  def show; end

  def new
    @booking = current_user.bookings.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.painting = @painting
    @booking.user = current_user
    authorize @booking
    if @booking.save
     redirect_to booking_path(@booking)
    else
      render 'paintings/show'
    end


  end

  def update
    @booking.update_attribute('confirmed', true)
    redirect_to dashboard_path
  end

  def destroy
    @booking.delete
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def set_painting
    @painting = Painting.find(params[:painting_id])
    # also probably 'authorize @painting'
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
