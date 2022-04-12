class player
    attr_reader :name
    def initialize(name)
        @name = name
    end

    def guess
        puts "Hi #{self.name}, please take a guess!"
        gets.chomp
    end

    def alert_invalid_guess
        puts "Invalid move. Please try again."
        self.guess
    end

end