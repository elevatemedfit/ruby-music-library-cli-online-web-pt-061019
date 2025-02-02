class Artist

extend Concerns::Findable


  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

   def self.create(artist)
     artist = new(artist)
     artist.save
     artist
   end

  def self.destroy_all
    all.clear
  end

  def genres
    songs.collect(&:genre).uniq
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song) 
  end
end
