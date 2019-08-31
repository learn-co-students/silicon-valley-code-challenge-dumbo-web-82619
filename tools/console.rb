require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
apple = Startup.new("apple", "Belle", "domain1")
etsy = Startup.new("esty", "Jess", "domain2")

vc1 = VentureCapitalist.new("George", 3000000000)
vc2 = VentureCapitalist.new("Anna", 900000)
vc3 = VentureCapitalist.new("Henry", 500)

fr1 = FundingRound.new(apple, vc1, "Angel", 3000000)
fr2 = FundingRound.new(apple, vc1, "Angel", 1000000)
fr3 = FundingRound.new(etsy, vc2, "Angel", 2000000)
fr4 = FundingRound.new(apple, vc3, "Angel", 350)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line