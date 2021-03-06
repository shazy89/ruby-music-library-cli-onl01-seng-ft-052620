class MusicLibraryController
attr_accessor :path
    def initialize(path="./db/mp3s")
        MusicImporter.new(path).import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        user_input = gets.strip
        if user_input == "exit"
            exit
        else
            call
        end
    end

    def list_songs
        Song.alphabetized.each.with_index(1) do |song, index| 
            puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            #binding.pry
        end
    end


end