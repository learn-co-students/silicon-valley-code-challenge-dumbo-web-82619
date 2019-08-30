require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

bennyland = Startup.new("Benny Land", "Benny Louie", "Entertainment")
bennytopia = Startup.new("BennyTopia", "Benny Louie", "City")
newheaven = Startup.new("New Heaven", "Random Deity", "World")
newhell = Startup.new("New Hell", "Random Deity", "World")

geniuslookout = VentureCapitalist.new("Genius Lookout", 5000000000)
noviceSeeker = VentureCapitalist.new("Novice Seeker", 850000)
fruitofheaven = VentureCapitalist.new("Fruit of Heaven", 2500000000)
poisonfruit = VentureCapitalist.new("Poison Fruit", 4255000000)

f1 = FundingRound.new("Pre-Seed", 80000, bennyland, noviceSeeker)
f2 = FundingRound.new("Seed", 200000, newheaven, geniuslookout)
f3 = FundingRound.new("Seed", 5000, newhell, noviceSeeker)
f4 = FundingRound.new("Pre-Seed", 1000000000, bennytopia, geniuslookout)
f5 = FundingRound.new("Seed", 364000, bennyland, geniuslookout)
f6 = FundingRound.new("Pre-Seed", 100000, bennyland, fruitofheaven)
f7 = FundingRound.new("Seed", 85000, bennyland, poisonfruit)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line