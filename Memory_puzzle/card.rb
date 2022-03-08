require_relative "game"
require_relative "board"

class Card
    # need card pairs
    CARDS = ("A".."Z").to_a

    attr_reader :face_value, :state
 
    def initialize
        @face_value = CARDS.sample
        @face_up = false
    end
    
    def hide
        @face_up = false
    end
    
    def reveal
        @face_up = true
    end

    def to_s
        @face_value.to_s
    end

    def ==

    end
end