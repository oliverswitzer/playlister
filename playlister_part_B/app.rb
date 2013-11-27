#app.rb

class Playlister

  attr_accessor :directory

  def initialize(directory="data")
    @directory = directory
  end

  def collect_songs
    song_array = Dir.entries(directory).select {|f| !File.directory? f}
    song_array
  end

end
