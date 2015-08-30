require 'pry'
class Song
  # code here
  attr_accessor :name, :genre, :artist

@@songs = []

  def initialize
    @@songs << self
    @genre = genre
    @artist = artist
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    @@songs.count
  end

  def self.all
    @@songs
  end

  def self.find_by_name(name)
    @@songs.find {|song| song.name == name}
  end

  def self.create_by_name(name)
    @song = Song.new 
    @song.name = name
    @song
  end
  
  def to_s
  # "Miley Cyrus - We Can't Stop [Pop]")
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end


end