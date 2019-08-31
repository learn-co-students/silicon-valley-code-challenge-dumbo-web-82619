class Startup
    attr_reader :founder, :domain, :name
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
    end

    def sign_contract(vc_object, type, amount)
        Funding.new(self, vc_object,type,amount)
    end

    def num_funding_rounds
        FundingRound.all.select do |funding|
            funding.startup == self
        end
    end

    def total_funds
        total = num_funding_rounds.sum do |fr|
            fr.venture_capitalist.total_worth
        end
    end

    def investors
        investors = FundingRound.all.select do |fr|
            fr.startup == self
        end
        investors.map do |investor|
            investor.venture_capitalist.name
        end.uniq
    end


    def self.all
        @@all
    end

    def self.find_by_founder(name)
        @@all.find do |startup|
            startup.founder == name
        end
    end

    def self.domains
        @@all.map do |startup|
            startup.domain
        end
    end
end
