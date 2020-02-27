class PaintingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]

  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  def index
    @paintings = policy_scope(Painting)
    @paintings = Painting.geocoded #returns paintings with coordinates
    if params[:query].present?
      @paintings = Painting.search_by_title_and_artist(params[:query])
    else
      @paintings = Painting.all
    end

    @markers = @paintings.map do |painting|
      if painting.latitude.nil?
        painting.latitude = 52.5067
        painting.longitude = 13.4392
        painting.save!
      end
      {
        lat: painting.latitude,
        lng: painting.longitude,
        infoWindow: render_to_string(partial: "info_window_link", locals: { painting: painting }),
        image_url: helpers.asset_url('pinsel-marker.jpg'),
      }
    end
  end

  def show; end

  def new
    @painting = Painting.new
    @painting = current_user.paintings.new
    authorize @painting
  end

  # ADD NOTICES AS SOON AS PUNDIT LOGIC WORKS

  def create
    @painting = current_user.paintings.new(painting_params)
    @painting.user = current_user
    authorize @painting
    if @painting.save
      redirect_to painting_path(@painting)
    else
      render :new
    end
  end

  def edit
    if current_user == @painting.user
    end
  end

  def update
    @painting.update(painting_params)
    # if and else logic like create as soon as pathing clear
    redirect_to painting_path(@painting)
  end

  def destroy
    @painting.destroy
    # redirect_to paintings_path => MUST BE LIKE user_paintings_path(@user)
    redirect_to paintings_path(@painting)
  end

  private

  def set_painting
    @painting = Painting.find(params[:id])
    authorize @painting
  end

  def painting_params
    params.require(:painting).permit(:artist, :title, :price_per_day, :address, :photo)
  end
end
