class VentureCapitalist

    attr_reader(:name, :total_worth)

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |vs|
            vs.total_worth >= 1000000000
        end
    end

    def offer_contract(startup, type, investment)
        if investment < 0
            "You cannot give a negative investment!"
        else
            FundingRound.new(type, investment, startup, self)
        end
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end

    def portfolio
        invested_startups = self.funding_rounds.map do |round|
            round.startup
        end
    end

    def investments
        self.funding_rounds.map do |round|
            round.investment
        end
    end

    def biggest_investment
        self.investments.max
    end

    def invested(domain)
        invested_domains = self.portfolio.select do |startup|
            startup.domain == domain
        end
        if invested_domains.size == 0
            "Sorry, we have not invested in that domain"
        else
            invested_domains
        end
    end

end
