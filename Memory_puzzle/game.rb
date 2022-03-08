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

        end
    end

end 