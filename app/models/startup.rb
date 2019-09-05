class Startup
    #Attribute Reader
    attr_reader :name, :founder, :domain

    #Global variable (array of all startups)
    @@all = []

    #initialize startup
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    #Only method that can change startup's name and domain
    def pivot(new_name, new_domain)
        @name = new_name
        @domain = new_domain
    end

    #return all startups instances
    def self.all()
        @@all
    end

     #returns startup whos founder_name matches
    def self.find_by_founder(founders_name)
        @@all.select do |startup|
            startup.founder == founders_name
        end
    end

    #returns startup_domains[]
    def self.domains()
        self.all.map do |startup|
            startup.domain
        end

    end

    #Creates a new funding round and associates the startup with the venture capitalist
    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end

    #Returns the total number of funding rounds that the startup has gotten
    # def num_funding_rounds()
    #     fundings_made = FundingRound.all().select do |funding|
    #         funding.startup = self
    #     end
    #     fundings_made.count
    # end

    # Returns the total funding rounds that the startup has gotten
    # Helper method
    def funding_rounds
        funding_rounds = FundingRound.all().select do |funding|
            funding.startup == self
        end
    end

    #Returns total number of funding rounds that startup has gotten
    def num_funding_rounds()
        self.funding_rounds().count
    end

    #returns sum of all the investments that startup has gotten $$
    def total_funds()
        funds = 0
        self.funding_rounds().each {|funding| funds += funding.amount}
        return "$ #{funds.to_f}"
    end

    #Returns a **unique** array of all the venture capitalists that have invested in this company
    def investors()
        investors = funding_rounds().map do |funding|
            funding.venture_capitalist
        end
        investors.uniq
    end

    # Returns a **unique** array of all the venture capitalists that have invested in this company and are in the Trés Commas club -->
    def big_investors 
        self.investors().select do |investor|
            VentureCapitalist.tres_commas_club().include?(investor)  
        end
    end


end
