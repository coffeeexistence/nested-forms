class Album < ActiveRecord::Base
  has_many :songs

  def songs_attributes=(songs)
    songs.each do |key, song|
      #byebug
      unless song['title'] == ''
        @song = self.songs.find_or_create_by(title: song['title'])
        @song.update(song)
      end
    end
  end

end
