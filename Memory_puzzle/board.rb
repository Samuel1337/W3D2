require_relative "game"
require_relative "card"

class Board

    CARDS = ("A".."Z").to_a
    attr_reader :grid, :size

    def initialize(num)
        @grid = Array.new(num) { Array.new(num) }
        @size = num
        @cards = []

    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def populate
        new_grid = []
        while @cards.length < (@size * @size) / 2 do 
            new_card = CARDS.sample
            @cards << new_card if !@cards.include?(new_card)
        end
        @cards *= 2 # @cards = [ "A", "Z", "P", "S", "O", "K", "A", "Z", "P", "S", "O", "K" ]

        random_cards = @cards.sample(@cards.length)
        random_cards.map! { |ele| Card.new(ele) }
        while new_grid.length < @grid.length do
            new_grid << random_cards.shift(@size)
        end

        @grid = new_grid

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
    displayGrid.each_with_index do |subgrid, idx| 
        if subgrid.all? { |ele| ele.is_a?(String) }
            puts subgrid.join(" ")   
        elsif !subgrid[idx].is_a?(String)
            subgrid[idx].face_value if subgrid[idx].face_up == true

        end

    end
   end

   def won?
    @grid.all? { |subgrid| subgrid.all? { |card| card.face_up }}
   end

   def reveal(guessed_pos)
    @grid[pos].face_up = true 
   end

end

if false 
    #pry testing
    load "board.rb"
    a = Board.new(3)
    a.render
    a.populate
end