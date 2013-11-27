

class Song

  attr_accessor :name, :genre, :artist

  def initialize name="untitled", artist="n/a"
    @name = name
    @artist = artist  
  end

  def genre= genre
    @genre = genre
    genre.songs << self
  end

  def artist= artist
    @artist = artist
    artist.songs << self
  end

end
