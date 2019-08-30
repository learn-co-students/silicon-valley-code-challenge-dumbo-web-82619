require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Airbnb", "Brian Chesky","www.airbnb.com")
startup2 = Startup.new("LinkedIn", "Reid Hoffman","www.linkedin.com")

vc1 = VentureCapitalist.new("Breyer", 1100000000.00)
vc2 = VentureCapitalist.new("Fred Wilson", 500000.00)

fr1 = FundingRound.new(startup1, vc1, "Angel", 10000.00)
fr2 = FundingRound.new(startup1, vc2, "Pre-Seed", 20000.00)
fr3 = FundingRound.new(startup2, vc2, "Seed", 20000.00)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line