class VentureCapitalist
    @@all =[]
    attr_reader :name, :total_worth
    def initialize(name, worth) 
        @name = name 
        @total_worth = worth
        @@all << self 
    end 
    def self.all 
        @@all 
    end 
    def self.tres_commas_club 
        @@all.select {|pigs| pigs.total_worth > 1000000000}
    end 

    def offer_contract(startup, type, amt)
        FundingRound.new(startup, self, type, amt)
    end 

    def funding_rounds 
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end 

    def portfolio 
        nonun = funding_rounds.each.collect {|round| round.startup}
        nonun.uniq 
    end 

    def biggest_investment 
        funding_rounds.max_by {|round| round.investment}
    end 

    def invested(domain)
        all = funding_rounds.select {|round| round.startup.domain == domain}
        all.inject(0) {|sum, round| sum + round.investment}
    end 

end

