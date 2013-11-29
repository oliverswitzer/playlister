require './lib/artist'
require './lib/genre'
require './lib/song'
require './spec_helper'
require './parser'


describe Parser, "#collect_songs" do 
  
  it "should return an array of string mp3 file names in data" do
    song_array = Dir.entries("data").select {|f| !File.directory? f}

    test_playlist = Playlister.new("data")

    expect(test_playlist.collect_songs).to eq(song_array)
  end
end


describe Parser, "#match_song" do 
  
  it "should return the matched song name for any given mp3 file in data" do

    test_mp3 = "Adele - Rolling In the Deep [folk].mp3"

    test_playlist = Playlister.new("data")

    expect(test_playlist.match_song(test_mp3)).to eq("Rolling In the Deep")
  end
end

describe Parser, "#match_artist" do 
  
  it "should return the matched artist name for any given mp3 file in data" do

    test_mp3 = "Adele - Rolling In the Deep [folk].mp3"

    test_playlist = Playlister.new("data")

    expect(test_playlist.match_artist(test_mp3)).to eq("Adele")
  end
end

describe Parser, "#match_genre" do 
  
  it "should return the matched genre name for any given mp3 file in data" do

    test_mp3 = "Adele - Rolling In the Deep [folk].mp3"

    test_playlist = Playlister.new("data")

    expect(test_playlist.match_genre(test_mp3)).to eq("folk")
  end
end



# describe Parser, "#new_artist_object" do

#   it "should create an artist with name, song and genre attributes for any given mp3" do

#     test_playlist = Playlister.new("data")

#     test_mp3 = "Adele - Rolling In the Deep [folk].mp3"

#     expect(test_playlist.new_artist_object(test_mp3).name).to eq("Adele")
#     expect(test_playlist.new_artist_object(test_mp3).songs[0].name).to eq(["Rolling In the Deep"])
#     expect(test_playlist.new_artist_object(test_mp3).genres[0].name).to eq(["folk"])
#   end

#   it "should only create a new artist object if an artist with that name has not been created yet, 
#   otherwise, will return 'Artist already exists" do

#     test_playlist = Playlister.new("data")
#     test_mp3_1 = "Adele - Rolling In the Deep [folk].mp3"
#     test_mp3_2 = "Adele - Someone Like You [country].mp3"

#     expect(test_playlist.new_artist_object(test_mp3_1).class).to eq(Artist)
#     expect(test_playlist.new_artist_object(test_mp3_2).class).to eq(String)
#   end

# end

describe Parser, "#parse" do
  it "should parse through each mp3 and return an array of artist objects" do
    my_parser = Parser.new(data)
    my_parser.parse
    expect(my_parser.artists.all? {|element| element.class == Artist}).to eq(true)
  end
end







