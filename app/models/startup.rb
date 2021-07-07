require 'pry'

class Startup

    attr_reader(:name, :founder, :domain)

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
        "This startup's domain and name have been changed"
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_arg)
        startup = self.all.select do |startup|
            startup.founder.downcase == founder_arg.downcase
        end
        if startup.size == 0
            "There is no startup by that founder"
        else
            startup
        end
    end

    def self.domains
        domains = self.all.map do |startup|
            startup.domain
        end
        domains.uniq
    end

    def sign_contract(venture_capital, investment_type, investment_amount)
        if investment_amount < 0
            "You cannot give a negative investment!"
        else
            FundingRound.new(investment_type, investment_amount.to_s.to_f, self, venture_capital)
        end
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.startup == self
        end
    end

    def num_funding_rounds
        self.funding_rounds.size
    end

    def total_funds
        self.funding_rounds.reduce do |total, round|
            total.investment + round.investment 
        end
    end

    def investors
        investors = self.funding_rounds.map do |round|
            round.venture_capitalist
        end
        investors.uniq
    end

    def big_investors
        self.investors.select do |investor|
            VentureCapitalist.tres_commas_club.include?(investor)
        end
    end
end
