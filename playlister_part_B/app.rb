#app.rb
require 'debugger'

class Playlister

  attr_accessor :directory, :song_array

  def initialize(directory="data")
    @directory = directory
  end

  def collect_songs
    @song_array = Dir.entries(directory).select {|f| !File.directory? f}
    @song_array
  end


  def match_song mp3_file
    song_regex = /.*\s-\s(.*)\s\[/
    m = song_regex.match(mp3_file)
    m[1]   #this will be equal to the song title
  end

  def match_artist mp3_file
    artist_regex = /(.*)\s-/
    m = artist_regex.match(mp3_file)
    m[1]
  end

  def match_genre mp3_file
    genre_regex = /.*\s-\s.*\s\[(\w+)\]/
    m = genre_regex.match(mp3_file)
    m[1]
  end

  def new_artist_object mp3_file
    artist_obj = "Artist already exits"
    debugger
    unless Artist.all.collect {|obj| obj.name}.include? match_artist(mp3_file)   #unless the artist with name has already been instantiated
      name = match_artist(mp3_file)
      song = new_song_object(match_song(mp3_file), match_artist(mp3_file, match_genre(mp3_file)))
      genre = Genre.new(match_genre(mp3_file))
      artist_obj = Artist.new       #create new artist object
      artist_obj.name = name
      artist_obj.genres << genre
      artist_obj.songs << song
    end
    debugger
    artist_obj
  end

  def new_song_object name, artist, genre
    song = Song.new
    song.genre = genre
    song.name = name
    song.artist = artist
  end

end
