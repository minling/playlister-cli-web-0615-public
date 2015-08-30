class Genre
  # code here
  attr_accessor :name, :songs, :artists

@@genres = []

  def initialize
    @@genres << self
    @songs = []
    @artists = []
  end

  def self.count
    @@genres.count
  end

  def self.all
    @@genres
  end

  def self.reset_all
    self.all.clear
  end

  def self.find_by_name(name)
    @@genres.find { |genre| genre.name == name}
  end

  def self.create_by_name(name)
    @genre = Genre.new
    @genre.name = name
    @genre
  end

end