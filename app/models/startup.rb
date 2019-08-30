class Startup

    @@all =[]

    attr_reader :name, :founder, :domain

    def initialize(founder, domain)
        @founder = founder 
        @@all << self 
        @domain = domain
    end 

    def pivot(domain, name)
        @domain = domain
        @name = name  
    end 

    def self.all
        @@all
    end 

    def self.find_by_founder(founder)
        @@all.find{|startup| startup.founder == founder}
    end 

    def self.domains 
        @@all.map{|startup| startup.domain}
    end 

    def sign_contract(venture, type, amt)
        FundingRound.new(self, venture, type, amt)
    end 

    def rounds
        FundingRound.all.select {|round| round.startup == self}
    end

    def num_funding_rounds 
        rounds.size
    end 

    def total_funds 
        rounds.inject(0) {|sum, round| sum + round.investment}
    end 

    def investors 
        nonun = rounds.each.collect {|round| round.venture_capitalist}
        nonun.uniq 
    end 

    def big_investors
        investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end

end
