require_relative "board"
require_relative "card"

class Game

    def initialize(num=4)
        @board = Board.new(num)
        @board.populate
        @guessed_pos = [0, 0]

    end

    def make_guess
        begin
            puts "Enter 2 numbers: "
            x, y = gets.chomp.split(" ").map(&:to_i)
            pos = [x, y]
            if @board[pos].face_up == true || (!(0..@board.size).to_a.include?(x) || !(0..@board.size).to_a.include?(y))
                puts "Try again!"
                raise RuntimeError.new "already guessed"
            else
                return [x, y]
            end
            rescue
                retry
            end
    end

    def play
        while @board.won? == false do 
            system("clear")
            @board.render
            
            @guessed_pos = make_guess
            
            system("clear")
            @board.reveal(@guessed_pos)
        
            new_pos = make_guess

            system("clear")
            @board.reveal(new_pos)

            if !(@board[@guessed_pos] == @board[new_pos])
                @board[@guessed_pos].face_up = false
                @board[new_pos].face_up = false
                sleep(1)
            end
        end
    end
end 
# if false
#     load "game.rb"
#     load "board.rb"
#     load "card.rb"
    
# end