
class Song

  # include Concerns::Findable

 attr_accessor :name
 attr_reader :artist, :genre

@@all = []

def initialize(name, artist = nil, genre = nil)
@name = name
if artist != nil
  self.artist = artist
end
if genre != nil
  self.genre = genre
end
save# calls the save method below to save each new or instantiated song
end

 def genre
   @genre
 end

def genre=(genre)
  @genre = genre
  genre.add_song(self)
end

def artist
  @artist
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def self.all
@@all
end

 def save
   self.class.all << self
 end

 def self.create(song)
   self.new(song)
 end

 def self.find_by_name(name)
   self.all.find {|song| song.name == name}
 end

 def self.find_or_create_by_name(name)
   self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
 end

 def self.destroy_all
   all.clear
 end

  def self.new_from_filename(name)
    artist,song,genre_name = name.split(" - ")
     fixed_name = genre_name.gsub(".mp3", "")
     artist = Artist.find_or_create_by_name(artist)
     genre = Genre.find_or_create_by_name(fixed_name)
     new(song, artist, genre)
  end

  def self.create_from_filename(name)
    new_from_filename(name).save

  end
end
