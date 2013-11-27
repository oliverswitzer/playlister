

class Genre

  attr_accessor :name, :songs, :artists

  @@all = []

  def initialize name="n/a" 
    @name = name
    @songs = []
    @artists = []
    @@all << self
  end

  def self.reset_genres
    @@all = []
  end

  def self.all
    @@all
  end


end
