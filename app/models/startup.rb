class Startup
attr_reader :founder, :domain
attr_accessor :name

@@all = []

def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
end

 def pivot(domain, name)
    @domain= domain
    @name=name
end

def self.all
    @@all
end

def self.find_by_founder(founder)
    self.all.find {|startup| startup.founder == founder}
end

def self.domains
    self.all.map do |startup|
        startup.domain
    end
end

def sign_contract(venture_capitalist,invest_type, amount_invest)
    FundingRound.new(self.name, venture_capitalist, invest_type, amount_invest)
end

def num_funding_rounds
    total = FundingRound.all.select do |funding_round|
        funding_round.startup == self
    end
    total.size
end

def total_funds 
    funding = FundingRound.all.select do |funding_round|
        funding_round.startup == self
    end
    total = funding.map do |funding_round|
        funding_round.investment
    end
    total.sum
end

def investors
    all_vc = FundingRound.all.select do |funding_round|
        funding_round.startup == self
    end
    total_vc = all_vc.map do |funding_round|
        funding_round.venture_capitalist 
    end
    total_vc.uniq
end

def big_investors 
    vc_names = investors.map do |venture_capitalist|
        venture_capitalist.name
    end
    vc_names & VentureCapitalist.tres_commas_club
end

    






end
