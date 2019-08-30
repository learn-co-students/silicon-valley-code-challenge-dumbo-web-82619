class FundingRound

    attr_reader(:startup, :venture_capitalist, :investment, :type)

    @@all = []

    def initialize(type, investment, startup, venture_capitalist)
        if investment < 0
            type = type
            @investment = "Please give a proper investment"
            @startup = startup
            @venture_capitalist = venture_capitalist
        else
            @type = type
            @investment = investment.to_s.to_f.round(2)
            @startup = startup
            @venture_capitalist = venture_capitalist
            @@all << self
        end
    end

    def self.all
        @@all
    end
end
