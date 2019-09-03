require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
omnios = Startup.new("Omnios", "Nick", "Technology")
tesla = Startup.new("Tesla", "Elon", "Auto Industry")
fb = Startup.new("Facebook", "Mark", "Social Media")
paypal = Startup.new("PayPal", "Mafia", "Financial")

elon = VentureCapitalist.new("Elon Musk", 150000000)
marc = VentureCapitalist.new("Marc Andreesen", 300000000)
jeff = VentureCapitalist.new("Jeff Bezos", 150000000000)

round1 = omnios.sign_contract(marc, "Angel", 300000)
round2 = elon.offer_contract(paypal, "Pre-Seed", 600000)
round3 = omnios.sign_contract(jeff, "Unicorn", 50005000)
round4 = omnios.sign_contract(elon, "Unicorn", 200000)

# puts round1.investment
# puts round2.type
# omnios.investors.each{|investor| puts investor.name}
puts omnios.big_investors[0].name
# puts elon.funding_rounds
# elon.portfolio.each{|startup| puts startup.name}
# puts elon.biggest_investment.startup.name
# puts elon.invested("Technology")



binding.pry
0 #leave this here to ensure binding.pry isn't the last line