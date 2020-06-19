require 'pry'

class Genre 

attr_accessor :name, :songs 
extend Concerns::Findable
include Concerns::Creatable::InstanceMethods
extend Concerns::Creatable::ClassMethods

@@all = []

 def initialize(name)
    
    self.name = name
    self.songs = []


    self.save

 end

 def save
    @@all << self
 end
def self.destroy_all
    self.all.clear
end
def self.all
    @@all
end

def self.create(name)
   self.new(name).tap {|obj| obj.save}
   #.tap takes whatever we are taping and returns any kind of logik 
end
def artists
    self.songs.map {|song| song.artist}.uniq
end
def self.alphabetized
    self.all.sort {|x,y| x.name <=> y.name}
end

end