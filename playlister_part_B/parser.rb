#app.rb
require 'debugger'
require './lib/artist'
require './lib/genre'
require './lib/song'


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

  def push_song_to_existing_genre song, existing_genre_name
    existing_genre = Genre.all.select {|genre_obj| genre_obj.name == existing_genre_name}
    existing_genre[0].songs << song
    song.genre = existing_genre[0]
  end

  def push_song_to_new_genre song, new_genre_name
    new_genre = Genre.new(new_genre_name)
    new_genre.songs << song
    song.genre = new_genre
  end

  def push_song_to_existing_artist song, existing_artist_name
    existing_artist = Artist.all.select {|artist_obj| artist_obj.name == existing_artist_name}
    existing_artist[0].songs << song
    song.artist = existing_artist[0]
  end

  def push_song_to_new_artist song, new_artist_name
    new_artist = Artist.new(new_artist_name)
    new_artist.songs << song
    song.artist = new_artist
  end

  def new_song_object mp3_file
    title = match_song(mp3_file)
    artist = match_artist(mp3_file)
    genre = match_genre(mp3_file)

    song = Song.new(title)

    genre_names = Genre.all.collect {|genre_obj| genre_obj.name}

    debugger

    if genre_names.include?(genre)
      push_song_to_existing_genre(song, genre)
    else
      push_song_to_new_genre(song, genre)
    end

    artist_names = Artist.all.collect {|artist_obj| artist_obj.name}

    if artist_names.include?(artist)
      push_song_to_existing_artist(song, artist)
    else
      push_song_to_new_artist(song, artist)
    end
    
    song
    debugger
    puts

  end

end


my_playlister = Playlister.new

puts my_playlister.new_song_object("Adele - Rolling In the Deep [folk].mp3")