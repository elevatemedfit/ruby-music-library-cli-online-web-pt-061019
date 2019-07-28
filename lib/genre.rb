class Genre

extend Concerns::Findable

attr_accessor :name
attr_reader :songs

@@all = []

def initialize(name)
@name = name
@songs = []
save
end

def self.all
@@all
end

 def save
   self.class.all << self
 end

 # def self.create(genre)
 #    self.new(genre)
 # end

 def self.destroy_all
   all.clear
 end

 def artists
   songs.collect(&:artist).uniq
 end


 def add_song(song)
   if song.genre == nil #at instantiation, if song does not belong to artist,
     song.genre = self
   end
   if !@songs.include?(song) #If me the artist, my list of songs does not include this song, I want to push it in.
     @songs << song
   end
 end
end
