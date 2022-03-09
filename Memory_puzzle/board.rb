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
        @cards *= 2
    
        random_cards = @cards.sample(@cards.length)
        random_cards.map! { |ele| Card.new(ele) }

        while new_grid.length < @grid.length do
            new_grid << random_cards.shift(@size)
        end

        @grid = new_grid
        nil
    end

   def render
    topBorder = ["#"] + (0...@grid.length).to_a
    displayGrid = []
    new_grid = @grid.dup
    new_grid.each_with_index do |subArr, i|
       subArr.unshift(i)
        displayGrid << subArr
    end
    
    displayGrid.unshift(topBorder) 
    
    displayGrid.each do |subgrid| 
        if subgrid.all? { |ele| ele.is_a?(String) || ele.is_a?(Integer) }
            puts subgrid.join(" ")   
        else 
            new_subgrid = subgrid.map do |ele|
                if ele.is_a?(Card)
                    ele.to_s 
                else
                    ele
                end
            end
            puts new_subgrid.join(" ")
        end

    end
    @grid.map! { |ele| ele[1..-1]}
    nil
   end

   def won?
    @grid.all? { |subgrid| subgrid.all? { |card| card.face_up }}
   end

   def reveal(guessed_pos)
    self[guessed_pos].face_up = true 
    render
   end

end

if false 
    #pry testing
    load "board.rb"
    a = Board.new(4)
    a.render
    a.populate
end