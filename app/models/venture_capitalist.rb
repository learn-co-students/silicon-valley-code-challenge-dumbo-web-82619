class VentureCapitalist
  attr_reader :name
  attr_accessor :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth.to_f
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_comma_club
    self.all.select do |vc|
      vc.total_worth >= 1000000000
    end
  end

  def offer_contract(startup, investment_type, investment)
    FundingRound.new(startup, self, investment_type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |fund|
      fund.venturecapitalist == self
    end
  end

  def portfolio
    portfolio = self.funding_rounds.map do |fund|
      fund.startup
    end
    portfolio.uniq
  end

  def biggest_investment
    investments = self.funding_rounds.map do |round|
      round.investment
    end
    investments.max 
  end

  def invested(invested_domain)
    investments = self.funding_rounds.select do |round|
      round.startup.domain == invested_domain
    end
    investments.reduce(0) do |sum, round|
      sum += round.investment
    end
  end


end
