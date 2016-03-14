class AlbumsController < ApplicationController
  def index
    @albums=Album.all
  end

  def new
    @album=Album.new
    @songs_attributes = Array.new(7) { @album.songs.build }
    @genres_attributes = Array.new(2) { Genre.new }
  end

  def create
    @album=Album.create(name: album_params['name'])
    @album.update(album_params)
    redirect_to album_path(@album)
  end

  def show
    @album=Album.find(params[:id])
  end

  private

  def album_params
    params.require(:album).permit!
  end
end
