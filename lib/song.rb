require 'pry'
class Song
  def initialize( name )
    @name = name
    ALL << self
  end
  attr_accessor :name, :artist, :genre

  ALL = []
  ####################################################
  def self.all
    ALL
  end

  def self.new_by_filename( filename )
    song_info = filename.split(' - ')
    song_name = song_info[1]
    song = self.new( song_name )
    song.artist = Artist.find_or_create_by_name( song_info[0] )
    song.genre = song_info[2][0..-5]
    song
  end
end
