class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def artist_attributes=(artist)
    unless artist['name'] == ''
        self.artist = Artist.find_or_create_by(name: artist['name'])
    end
  end

end
