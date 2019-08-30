class Startup

    attr_reader :name, :founder, :domain
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    # Given a string of a domain and a string of a **name**, change the domain and name of the startup. This is the only public method through which the domain can be changed.
    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    # Given a string of a **founder's name**, returns the **first startup** whose founder's name matches
    def self.find_by_founder(founder)
        self.all.select do |startup|
            startup.founder == founder
        end
    end

    # Returns an array of all of the different startup domains
    def self.domains
        all_domains = self.all.map do |startup|
            startup.domain
        end
        all_domains.uniq
    end

    # Given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    # Created a helper method that was not required (but helpful!)
    # Returns an array of all the funding rounds of this Startup instance
    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end
    end

    # Returns the total number of funding rounds that the startup has gotten
    def num_funding_rounds
        self.funding_rounds.count
    end

    # Returns the total sum of investments that the startup has gotten
    def total_funds
        investments = self.funding_rounds.map do |funding_round|
            funding_round.investment
        end
        investments.sum
    end

    # Returns a unique array of all the venture capitalists that have invested in this company
    def investors
        venture_capitalists = self.funding_rounds.map do |funding_round|
            funding_round.venture_capitalist
        end
        venture_capitalists.uniq
    end

    # Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club
    def big_investors
        self.investors.select do |investor|
            investor.total_worth > 1000000000
        end
    end

end
