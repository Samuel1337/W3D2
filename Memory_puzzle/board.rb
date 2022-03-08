require_relative "game"
require_relative "card"

class Board

    CARDS = ("A".."Z").to_a
    attr_reader :grid, :size

   def initialize(num)
    @grid = Array.new(num) { Array.new(num) }
    @size = num * num
    @cards = []

   end

   def [](pos)

   end

   def []=(pos, value)


   end

   def populate
    while @cards.length < @size / 2 do 
        new_card = CARDS.sample
        @cards << new_card if !@cards.include?(new_card)
    end
    @cards *= 2

    
   end
    # make hidden board method
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