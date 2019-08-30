class VentureCapitalist
    
    attr_accessor :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth  = total_worth 
        @@all << self
    end 
    
    def self.all 
        @@all 
    end 

    # arr of all big capitalists instances, more than 1 billion
    def self.tres_commas_club
        VentureCapitalist.all.select do |v_capitalist|
        v_capitalist.total_worth > 1000000000.00 
        end
    end 

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end 


    # helper/bridge method: all funding rounds instances for this venture capitalist
    def funding_rounds
        FundingRound.all.select {|funding| funding.venture_capitalist == self}
    end 

    def portfolio
        invested_startup = self.funding_rounds.map {|funding| funding.startup}
        invested_startup.uniq
    end 

    # the largest funding round given by this venture c
    def biggest_investment
        self.funding_rounds.max_by {|funding| funding.investment }
    end 

    def invested(domain)
        # .find or .select  ??
        the_startup = self.portfolio.find {|startup| startup.domain == domain}
        
        foundings_to_the_startup = self.funding_rounds.select {|funding| funding.startup == the_startup}
        
        foundings_investments = foundings_to_the_startup.map {|funding| funding.investment}

        foundings_investments.sum

    end 
end