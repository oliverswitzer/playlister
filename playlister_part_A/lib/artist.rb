
class Artist

  attr_accessor :name, :songs, :genres

  @@count = 0
  @@all = []

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_artists
    @@count = 0
  end

  def initialize name="n/a", songs=[]
    @name = name
    @songs = songs
    @@count += 1
    @@all << self
    @genres = []
	end

  def songs_count
    @songs.size
  end

  def add_song song
    @songs << song
    @genres << song.genre
    if song.genre 
      unless song.genre.artists.include? self
        song.genre.artists << self
      end
    end
  end


end
