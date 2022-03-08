require_relative "board"
require_relative "card"

class Game

    def initialize(num=4)
        # make sure num is even, or just 4
        @board = Board.new(num)
        @guessed_pos = [0, 0]

    end

    def play
        
        while won? == false do 
            puts "Enter 2 numbers: "
            x, y = gets.chomp.split(" ")
            if @board[x, y].face_up == true
                puts "Try again!"
                raise RuntimeError.new "already guessed"
            else
                @guessed_pos = [x, y]
            end
            @board.reveal(@guessed_pos)
            puts "Enter 2 numbers: "
            i, j = gets.chomp.split(" ")
            new_pos = [i, j]
            if !(@board[@guessed_pos] == @board[new_pos])
                @board[@guessed_pos].face_up = false
                @board[new_pos].face_up = false
            end
        rescue
            retry
        end
    end

end 