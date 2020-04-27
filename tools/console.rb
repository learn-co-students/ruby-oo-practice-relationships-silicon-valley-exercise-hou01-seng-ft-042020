require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

founder1 = VentureCapitalist.new("freddy", 1000000000.0)
startup1 = Startup.new("flatiron", founder1, "tech")
startup2 = Startup.new("flatiron", founder1, "tech")

round1 = FundingRound.new(startup1, founder1, "Angel", 1000000.0)
round2 = FundingRound.new(startup1, founder1, "Angel", 2000000.0)
round3 = FundingRound.new(startup2, founder1, "Angel", 2000000.0)




binding.pry

0 #leave this here to ensure binding.pry isn't the last line