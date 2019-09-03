class VentureCapitalist

    attr_reader :name
    attr_accessor :total_worth

    @@all = []

    def initialize(name, total_worth)

        @name = name
        @total_worth = total_worth.to_f

        @@all << self

    end

    def name 
        @name
    end

    def total_worth
        @total_worth
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select{|investor| investor.total_worth > 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        rounds = FundingRound.all
        arr = rounds.select{|round| round.venture_capitalist == self}
    end

    def portfolio
        rounds = self.funding_rounds
        rounds.map{|round| round.startup}.uniq
    end

    def biggest_investment
        rounds = self.funding_rounds
        rounds.max_by{|round| round.investment}
    end

    def invested(domain)
        total = 0
        rounds = self.funding_rounds
        domain_rounds = rounds.select{|round| round.startup.domain == domain}
        domain_rounds.each{|round| total += round.investment}
        total
    end

end
