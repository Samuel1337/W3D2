require_relative "game"
require_relative "card"

class Board

    attr_reader :grid

   def initialize(num)
    @grid = Array.new(num) { Array.new(num) }

 

   end

   def [](pos)

   end

   def []=(pos, value)


   end

   def populate

   end

   def render

   end
    
   def won?
    @grid.all? { |subgrid| subgrid.all? { |card| card.face_up }}
   end

   def reveal(guessed_pos)

   end

   def print
    @grid.each { |subgrid| puts subgrid.join(" ") }
   end
end

if false 
    #pry testing
    load "board.rb"
    a = Board.new(3)
    a.print
end