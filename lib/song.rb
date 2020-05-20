class Song
  attr_accessor :name, :artist
@@all = []

def self.all
  @@all
end

def save
  self.class.all << self
end


  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    artist_name = file.split(" - ")[0]
    song_name = file.split(" - ")[1]
    song = Song.new(song_name)
    song.artist_name = artist_name
    song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    artist.add_song(self)
  end
  def songs
    Song.all.find { |song| song.artist == self }
    end
end
