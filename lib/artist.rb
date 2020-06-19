class Artist
    extend Concerns::Findable
    include Concerns::Creatable::InstanceMethods
    extend Concerns::Creatable::ClassMethods
    
    attr_accessor :name, :artist, :genre
    attr_reader :genre
    @@all = []
    def initialize(name)
        @name = name 
        @songs = []
        save
    end
    def songs
        @songs
    end
    def add_song(song)
        song.artist = self unless song.artist != nil
        @songs << song unless @songs.include?(song)
    end

     def genres
         @songs.map { |song| song.genre if song.artist == self}.uniq

     end   

    def self.all
        @@all
    end
    def save
        @@all << self
        self
    end
    def self.destroy_all
        @@all.clear
    end
    def self.create(name)
        self.new(name).save
    end
    def self.alphabetized
        self.all.sort {|x,y| x.name <=> y.name}
        
    end
end 