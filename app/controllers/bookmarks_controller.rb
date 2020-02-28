class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new
    @bookmark.painting = Painting.find(params[:painting_id])
    @bookmark.user = current_user
    authorize @bookmark
    if @bookmark.save
      redirect_to painting_path(@painting)
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    @painting = bookmark.painting
    bookmark.delete
    redirect_to painting_path(@painting)
  end
end
