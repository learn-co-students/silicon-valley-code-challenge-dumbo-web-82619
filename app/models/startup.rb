class Startup

    attr_reader :founder, :domain
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

    def self.all
        @@all
    end 

    # helper/bridge method: all foundingRound this startup got
    def fundings_this_st_got
        FundingRound.all.select do |funding_round|
            funding_round.startup == self 
        end 
    end 


    # returns the first startup whose founder's name matches using find
    def self.find_by_founder(founder_name)
        Startup.all.find do |startup|
            startup.founder == founder_name
        end 
    end 

    
    # return an array of all of the different startup domains
    def self.domains
        Startup.all.map do |startup|
            startup.domain
        end
    end 
    
    
    # creates a new funding round and associates it with that startup and venture capitalist.
    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end 

    def num_funding_rounds
        self.fundings_this_st_got.size
    end 

    def total_funds
        all_investment = self.fundings_this_st_got.map {|funding| funding.investment}
        all_investment.sum
    end 


    def investors
        all_investors = self.fundings_this_st_got.map {|funding| funding.venture_capitalist}
        all_investors.uniq
    end 

    def big_investors
        big_investors = self.investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor) == true}
        big_investors.uniq 
    end 






end
