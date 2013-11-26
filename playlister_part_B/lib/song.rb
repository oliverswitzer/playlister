

class Song

  attr_accessor :name, :genre

  def initialize name="untitled"
    @name = name
    @artist
  end

  def genre= genre="n/a"
    @genre = genre
    genre.songs << self
  end

end
