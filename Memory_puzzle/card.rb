require_relative "game"
require_relative "board"

class Card

    attr_reader :face_value
    attr_accessor :face_up
 
    def initialize(value)
        @face_value = value
        @face_up = false
    end

    def to_s
        @face_up == true ? @face_value.to_s : " "
    end

    def ==(card2)
        self.face_value == card2.face_value
    end
end
