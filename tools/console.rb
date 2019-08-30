require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#startups
pied_piper = Startup.new("Pied Piper", "Richard Hendricks", "Compression Software")
gitawonk = Startup.new("GitaWonk", "Willy Wonka", "Git Candy")
end_frame = Startup.new("End Frame", "Code Theif", "Stealing Code")

#VCs
bream_hall = VentureCapitalist.new("Bream Hall", 10000000)
raviga = VentureCapitalist.new("Raviga", 20000000)
hanneman = VentureCapitalist.new("Russ Hanneman", 3000000000)

#funding_rounds
raviga_to_pp = FundingRound.new(pied_piper, raviga, "Seed", 4000000)
raviga_to_pp = FundingRound.new(pied_piper, raviga, "Series B", 3000000)
hanneman_to_pp = FundingRound.new(pied_piper, hanneman, "Pre-seed", 2000000)
hanneman_to_ef = FundingRound.new(end_frame, hanneman, "Angel", 1000000)
bh_to_pp = FundingRound.new(pied_piper, bream_hall, "Series C", 5000000)
bh_to_gitawonk = FundingRound.new(gitawonk, bream_hall, "Series B", 2500000)
bh_to_ef = FundingRound.new(pied_piper, bream_hall, "Series C", -5000000)



# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

 binding.pry
 0 #leave this here to ensure binding.pry isn't the last line