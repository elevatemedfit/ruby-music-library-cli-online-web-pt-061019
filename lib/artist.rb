class Artist

extend Concerns::Findable


  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save #this saves new songs
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

   def self.create(artist)
     self.new(artist)
   end

  def self.destroy_all
    all.clear
  end

  def genres
    songs.collect(&:genre).uniq
  end

  def add_song(song)
    if song.artist == nil #at instantiation, if song does not belong to artist,
      song.artist = self
    end
    if !@songs.include?(song) #If me the artist, my list of songs does not include this song, I want to push it in.
      @songs << song
    end
  end
end
