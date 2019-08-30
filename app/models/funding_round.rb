class FundingRound
  attr_reader :startup, :venturecapitalist
  attr_accessor :type, :investment
  @@all = []

  def initialize(startup, venturecapitalist, type, investment)
    @startup = startup
    @venturecapitalist = venturecapitalist
    @type = type
    @@all << self

    if investment >= 0
      @investment = investment.to_f
    else
      @investment = 0.to_f
    end
  end

  def self.all
    @@all
  end

end
