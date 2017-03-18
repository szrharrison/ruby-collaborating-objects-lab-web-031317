require 'pry'
class Artist
  def initialize( name )
    @name = name
    @songs = []
  end
  attr_accessor :name
  attr_reader :songs
  ####################################################
  @@all = []
  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    artist = self.all.find do |artist|
      artist.name == name
    end
    artist ||= self.new( name )
    @@all << artist
    @@all.uniq!
    artist
  end
  ####################################################
  def save
    @@all << self
    @@all.uniq!
  end

  def add_song( song )
    song.artist = self
  end

  def songs
    songs_array = Song.all.select do |song_instance|
      song_instance.artist == self
    end
    @songs << songs_array
    @songs.flatten!.uniq!
    @songs
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end
end
