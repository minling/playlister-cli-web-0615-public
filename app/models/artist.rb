class Artist
  # code here
  attr_accessor :name, :songs, :genres
@@artists = []

  def initialize 
    @@artists << self
    @name = name
    @songs = []
    @genres = []
  end

  def self.all
    @@artists 
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def self.find_by_name(name)
    @@artists.find { |artist| artist.name == name }
  end

  def self.create_by_name(name)
    @artist = Artist.new
    @artist.name = name 
    @artist
  end

  def add_song(song)
    @songs << song
    @genres << song.genre
    if song.genre && song.genre.artists.include?(self) == false
      song.genre.artists << self
    end
  end

  def add_songs(songs)
    songs.each do |song| 
      @songs << song
    end
  end


end