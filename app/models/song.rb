class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def titleized_title
    self.title.titleize
  end

  def titleized_artist
    self.artist.name.titleize
  end

  def titleized_genres
    self.genres.pluck(:name).join(',').titleize
  end

  def artist_attributes=(artist)
    unless artist['name'] == ''
        self.artist = Artist.find_or_create_by(name: artist['name'].downcase)
    end
  end

  def genres_attributes=(genres)
    #byebug
    genres.each do |key, genre|
      unless genre['name'] == ''
          self.genres << Genre.find_or_create_by(name: genre['name'].downcase)
      end
    end
  end



end
