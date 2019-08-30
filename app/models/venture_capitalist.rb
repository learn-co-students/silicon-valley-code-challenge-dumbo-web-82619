class VentureCapitalist

    attr_reader :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    # Returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 `total_worth`).
    def self.tres_commas_club
        self.all.select do |venture_capitalist|
            venture_capitalist.total_worth > 1000000000
        end
    end

    # Given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist. 
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    # Returns an array of all funding rounds for that venture capitalist
    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist == self
        end
    end

    # Returns a unique list of all startups this venture capitalist has funded
    def portfolio
        startups = self.funding_rounds.map do |funding_round|
            funding_round.startup
        end
        startups.uniq
    end

    # Returns the largest funding round given by this venture capitalist
    def biggest_investment
        self.funding_rounds.max do |funding_round|
            funding_round.investment
        end
    end

    # Given a domain string, returns the total amount invested in that domain
    def invested(domain)
        funding_rounds_in_domain = self.funding_rounds.select do |funding_round|
            funding_round.startup.domain == domain
        end
        investments = funding_rounds_in_domain.map do |funding_round|
            funding_round.investment
        end
        investments.sum
    end

end
