require_relative "game"
require_relative "card"

class Board

    attr_reader :grid

   def initialize(num)
    @grid = Array.new(num) { Array.new(num, Card.new) }

 

   end

   def populate

   end

   def render

   end
    
   def won?

   end

   def reveal

   end
end