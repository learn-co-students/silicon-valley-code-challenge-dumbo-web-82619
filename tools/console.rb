require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

google = Startup.new("Google", "Larry Page & Sergei Pin", "www.google.com")
facebook = Startup.new("Facebook", "Mark Zuckerberg", "www.facebook.com")
uber = Startup.new("Uber", "Dara", "Uber App")



shark1 = VentureCapitalist.new("Mark Cuban", 1_000_000_000_000)
shark2 = VentureCapitalist.new("Kevin", 1_000_000_000_000)
shark3 = VentureCapitalist.new("Alex", 1_000)



FundingRound.new(google, shark1, "Series A", 1_000_000)
FundingRound.new(facebook, shark2, "Series B", 2_000_000)
FundingRound.new(facebook, shark2, "Angel", 200)


Startup.find_by_founder("Alex")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line