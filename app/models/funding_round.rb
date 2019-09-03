class FundingRound

    attr_reader :startup, :venture_capitalist, :investment
    attr_accessor :type

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)

        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type.to_s
        investment = 0 if investment < 0
        @investment = investment

        @@all << self

    end

    def startup
        @startup
    end

    def venture_capitalist
        @venture_capitalist
    end

    def type
        @type
    end

    def investment
        @investment
    end

    def self.all
        @@all
    end

end