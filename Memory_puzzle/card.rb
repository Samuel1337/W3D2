require_relative "game"
require_relative "board"

class Card

    attr_reader :face_value, :state
 
    def initialize(value)
        @face_value = value
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

    def ==(card2)
        self.face_value == card2.face_value
    end
end
