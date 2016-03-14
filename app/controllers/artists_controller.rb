class ArtistsController < ApplicationController
  def index
  end

  def new
    @artist=Artist.new
  end

  def create
    @artist=Artist.new(artist_params)
    byebug
  end

  def show
    @artist=Artist.find(params[:id])
  end

  private

  def artist_params
    params.require(:artist).permit(:name, album_attributes: [:name, song_attributes: [:title] ])
  end
end
