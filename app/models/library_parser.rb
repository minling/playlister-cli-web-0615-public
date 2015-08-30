class LibraryParser
  # code here

  def files
    @files = []
    folder = Dir.open('db/data')
    folder.select do |x|
      if (x.length > 2)
        @files <<  x 
      end
    end
    @files
  end

  def parse_filename(name)
    @file_name = []
    @file_name << artist = name.split(" -")[0]
    @file_name << song = name.split("- ")[1].split(" [")[0]
    @file_name << genre = name.split("[").last.gsub("].mp3", "")
    @file_name
  end

  def build_song(*parts)
    @artist = parts[0]
    @name = parts[1]
    @genre = parts[2]
    @song = Song.create_by_name(@name)
    @song.genre = Genre.create_by_name(@genre)
    @song.artist = Artist.create_by_name(@artist)
    @song
  end

  #test suite
  #song = parser.build_song(parts[0], parts[1], parts[2])
  #expect(Artist.find_by_name(parts[0])).to eq(song.artist)
  #return value of this Artist.find_by_name(parts[0])
#=> #<Artist:0x007ff78dccc770 @genres=[], @name="Action Bronson", @songs=[s]>
# so we will expect song.artist to return an object, meaning @song.artist must be an object

  # when calling song.artist, song is the return value of build_song which is @song
  # calling song.artist, artist is something inside the return value of build_song
  #can only do song.artist or @song.artist because @song is an object.
  def call
    files.each do |file|
    parts = parse_filename(file)
    build_song(parts)
  end 
  end
end