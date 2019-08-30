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

  def pivot(new_name, new_domain)
    @name = new_name
    @domain = new_domain
  end

  def self.find_by_founder(founder)
    self.all.find do |startup|
      startup.founder == founder
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end
  end

  def sign_contract(vc_firm, investment_type, fund_amount)
    FundingRound.new(self, vc_firm, investment_type, fund_amount)
  end

  def funding_rounds
    FundingRound.all.select do |fund|
      fund.startup == self
    end
  end

  def num_funding_rounds
    self.funding_rounds.count
  end

  def received_funds
    self.funding_rounds.map do |fund|
      fund.investment
    end
  end

  def total_funds
    self.received_funds.reduce(0) do |sum, fund|
      sum + fund
    end
  end

  def investors
    investors = self.funding_rounds.map do |fund|
      fund.venturecapitalist
    end
    investors.uniq
  end

  def big_investors
    self.investors.select do |investor|
      VentureCapitalist.tres_comma_club.include?(investor)
    end
  end   

end
