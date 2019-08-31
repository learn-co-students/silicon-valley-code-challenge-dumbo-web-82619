class VentureCapitalist
    attr_reader :name
    attr_accessor :total_worth

    @@all =[]

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all 
        @@all
    end

    def self.tres_commas_club
        self.all.select do |venture_capitalist|
            venture_capitalist.total_worth > 1000000000
        end
    end 

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self.name, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist == self
        end
    end

    def portfolio 
        vc_portfolio = funding_rounds.map do |funding_round|
            funding_round.startup
        end
        vc_portfolio.uniq
    end

    def biggest_investment
        funding_rounds.max_by {|funding_round| funding_round.investment}
    end

    def invested(domain)
        invested_list = funding_rounds.select do |funding_round|
            funding_round.startup.domain == domain
        end
        total = invested_list.map do |funding_round|
            funding_round.investment
        end
        total.sum
    end


            








end
