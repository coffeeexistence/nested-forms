class SongsController < ApplicationController
  def index
  end

  def new
    @song=Song.new
    @album = @song.albums.build
    @artist = @album.artist.build
  end

  def create
    byebug
    @song=Song.new(song_params)
  end

  def show
    @song=Song.find(params[:id])
  end

  private

  def song_params
    params.require(:song).permit(:title, album_attributes: [:name, artist_attributes: [:name] ])
  end
end
