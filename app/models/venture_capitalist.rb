class VentureCapitalist

    # Attribute reader
    attr_reader :name, :total_worth
    @@all = []

    # Venture Capitalist initializer
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    # Reads the class variable for all venture capitalists (return array[])
    def self.all
        @@all 
    end

    # Returns an array with all VC in the Tres Commas Club (>= $1,000,000,000)
    def self.tres_commas_club
        @@all.select do |investor|
            investor.total_worth >= 1_000_000

        end
    end

    # Creates a new funding round and associates it with the startup 
    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    # Returns an array of all funding rounds for that VC
    def funding_rounds
        FundingRound.all().select do |funding|
            if funding.venture_capitalist == self
                funding
            end
        end
    end

    # Returns an unique list of all starups for that VC
    def portfolio()
        # uniq_funding = self.funding_rounds().uniq
        # uniq_funding.map {|funding| funding.startup}
        startups = self.funding_rounds().map { |funding| funding.startup}
        startups.uniq 
    end

    # Returns a large funding round given by this VC
    def biggest_investment()
        funding_rounds = self.funding_rounds.select {|funding| funding.amount}
        amount = 0

        funding_rounds.select do |funding|

             if funding.amount >= amount
                amount = funding.amount
                funding
             end
             
        end
    end

    # - given a **domain string**, returns the total amount 
    #   invested in that domain
    def invested(domain)
        total_amount_invested = 0
    
        self.funding_rounds().each do |funding|
            if funding.startup.domain == domain
                total_amount_invested += funding.amount
            end
        end

        total_amount_invested
    end

end
