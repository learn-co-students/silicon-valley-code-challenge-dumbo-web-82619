class FundingRound

        # Attribute Reader
    attr_reader :startup, :venture_capitalist, :type, :amount
    @@all = []

    # Funding Round Initializer
    def initialize (startup, venture_capitalist, type, amount)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @amount = amount
        @@all << self
    end

    # Reads all the funding rounds ever created
    def self.all
        @@all
    end



end
