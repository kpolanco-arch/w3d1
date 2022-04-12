require_relative "player.rb"

class Game
    require "set"

    DICTIONARY = Set.new


        attr_reader :player_1, :player_2, :fragment
    def initialize(player_1, player_2)
        @player_1 = Player.new(player_1)
        @player_2 = Player.new(player_2)
        @fragment = fragment
        @dictionary = 
    end

    def valid_play?(string)
        alpha = ("a".."z").to_a
        alpha.include?(string) && @dictionary.include?(@fragment + string)
    end

    def take_turn(player)
        response = player.guess
        if valid_play?(guess)
            @fragment += string
        else
            player.alert_invalid_guess
        end
    end

    def current_player
        
    end

    def previous_player
        if 
    end

    def next_player!

    end

end