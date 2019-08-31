require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("McDo", "Ronald", "Global")
startup2 = Startup.new("Jobee", "Bee", "Philippines")

musk = VentureCapitalist.new("Elon Musk", 1000000000)
gates = VentureCapitalist.new("Bill Gates", 2000000000)
rey = VentureCapitalist.new("Rei Rey", 20000)

FundingRound.new(startup1,musk,"Angel", 2000)
FundingRound.new(startup1,musk,"Angel", 4000)
FundingRound.new(startup1, gates, "SuperAngel", 5000)

FundingRound.new(startup2,musk, "Devil", 1000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line