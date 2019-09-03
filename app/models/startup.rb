class Startup

    attr_reader :founder, :domain
    attr_accessor :name, :pivot

    @@all = []

    def initialize(name, founder, domain)

        @name = name.to_s
        @founder = founder.to_s
        @domain = domain.to_s

        @@all << self

    end

    def name 
        @name
    end

    def founder
        @founder
    end

    def domain
        @domain
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
    end

    def self.all 
        @@all
    end

    def self.find_by_founder(founder)
        @@all.each do |startup|
            if startup.founder == founder
                return startup
            end
        end
    end

    def self.domains
        @@all.map{|startup| startup.domain}.uniq
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        rounds = FundingRound.all
        num = rounds.select{|round| round.startup == self}.length
        num
    end
    
    def total_funds
        total = 0
        rounds = FundingRound.all
        our_rounds = rounds.select{|round| round.startup == self}
        our_rounds.each{|round| total += round.investment}
        total
    end

    def investors
        rounds = FundingRound.all
        our_rounds = rounds.select{|round| round.startup == self}
        investors = our_rounds.map{|round| round.venture_capitalist}
        return investors.uniq
    end

    def big_investors
        all = self.investors
        big = VentureCapitalist.tres_commas_club
        all & big
    end

end

