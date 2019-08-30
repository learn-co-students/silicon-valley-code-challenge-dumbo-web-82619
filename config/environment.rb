require 'bundler/setup'
require 'pry'
Bundler.require
require_rel '../app'

s1 = Startup.new("Google Jr", "Karen", "Technology")
s2 = Startup.new("Galaxy Move", "John", "Healthcare")
s3 = Startup.new("Operation Plus", "Christina", "Technology")

vc1 = VentureCapitalist.new("Neil Shen", 2000000000)
vc2 = VentureCapitalist.new("Bill Gurley", 900000000)
vc3 = VentureCapitalist.new("Alfred Lin", 1100000000)

fr1 = FundingRound.new(s1, vc1, "Angel", 150000.50)
fr2 = FundingRound.new(s2, vc1, "Seed", 550000.88)
fr3 = FundingRound.new(s3, vc2, "Seed", 190000.00)
fr4 = FundingRound.new(s1, vc3, "Pre-Seed", 90000.99)
fr5 = FundingRound.new(s3, vc3, "Series A", 800000.33)

binding.pry
0