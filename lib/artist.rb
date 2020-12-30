class Artist
    extend Concerns::Findable #take all of the methods in module and add them as class methods
  
    attr_accessor :name
    attr_reader :songs
  
    @@all = []
  
    def initialize(name) #instance method
      @name = name
      @songs = []
    end
  
    def self.all #class reader
      @@all
    end
  
    def self.destroy_all
      all.clear
    end
  
    def save #instance method
      self.class.all << self
    end
  
    def self.create(name)
      artist = new(name)
      artist.save
      artist
    end
  
    def add_song(song)
      song.artist = self unless song.artist
      songs << song unless songs.include?(song)
    end

    def genres
        songs.collect { |song| song.genre }.uniq
    end

end