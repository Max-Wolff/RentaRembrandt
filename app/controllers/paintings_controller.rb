class PaintingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]

  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  def index
    @paintings = Painting.all
  end

  def show; end

  def new
    @painting = Painting.new
    authorize @painting
  end

  def create
    @painting = Painting.new(painting_params)
    authorize @painting
    @user = current_user
    @painting.user = @user
    if @painting.save
      redirect_to painting_path(@painting)
    else
      render :new
    end
  end

  def edit; end

  def update
    @painting.update(painting_params)
    # redirect_to painting_path(@painting) => MUST BE LIKE user_paintings_path(@user)
  end

  def destroy
    @painting.destroy
    # redirect_to paintings_path => MUST BE LIKE user_paintings_path(@user)
  end

  private
  def set_painting
    @painting = Painting.find(params[:id])
  end

  def painting_params
    params.require(:painting).permit(:artist, :title, :price_per_day, :address)
  end
end
