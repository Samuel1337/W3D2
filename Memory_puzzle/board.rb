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
    topBorder = ["#"] + (0...@grid.length).to_a
    displayGrid = []
    @grid.each_with_index do |subArr, i|
       subArr.unshift(i)
        displayGrid << subArr
    end
    displayGrid.unshift(topBorder) 
    displayGrid.each { |subgrid| puts subgrid.join(" ") } # .ljust(2)
   end

   def won?
    @grid.all? { |subgrid| subgrid.all? { |card| card.face_up }}
   end

   def reveal(guessed_pos)

   end

end

if false 
    #pry testing
    load "board.rb"
    a = Board.new(3)
    a.render
end