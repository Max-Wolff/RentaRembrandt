class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  def index
    @paintings = Painting.all
  end

  def show; end

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)
    @user = User.find(params[:user_id])
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
