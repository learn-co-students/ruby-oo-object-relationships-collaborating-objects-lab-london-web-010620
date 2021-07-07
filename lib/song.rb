require 'pry'
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @artist = artist
        @@all << self
    end

    def name=(name)
        @name = name
    end


    def self.all
        @@all
    end

    def self.new_by_filename(file)
        file_name = file.split(" - ")
        name = file_name[1]
        artist = file_name[0]
        new_song_instance = self.new(name)
        new_song_instance.artist_name = artist
        new_song_instance
        # binding.pry
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        self.artist.add_song(self)
      end


end