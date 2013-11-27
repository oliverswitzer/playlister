require './lib/artist'
require './lib/genre'
require './lib/song'
require './spec_helper'
require './app'


describe Playlister, "#collect_songs" do 
  
  it "should return an array of string mp3 file names in data" do
    song_array = Dir.entries("data").select {|f| !File.directory? f}

    test_playlist = Playlister.new("data")

    expect(test_playlist.collect_songs).to eq(song_array)
  end
  
end