require 'pry'
class Artist
    attr_accessor :name, :artist, :songs
    
    
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end
    
    def self.all
        @@all
    end

    # def self.songs
    #     @songs
    # end
    
    def songs
        Song.all.select { |instance| instance.artist == self }
    end
    
    def add_song(song)
        song.artist = self
        @songs << song

    end

    def self.find_by_name(name)
        self.all.detect{|artist| artist.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.new(name)
    end

    def print_songs
        self.songs.each do |song|
          puts song.name
        end
      end
end

