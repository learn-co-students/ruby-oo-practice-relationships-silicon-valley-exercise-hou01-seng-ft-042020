require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup_1 = Startup.new("Google", "Beyonce")
startup_2 = Startup.new("Twitter", "Cole")

startup_1.pivot("www.fun.com", "RedBubble")

vc_1 = VentureCapitalist.new("Cole", 100)
vc_2 = VentureCapitalist.new("Phyllis", 40000000000)
vc_3 = VentureCapitalist.new("Beyonce", 999999999999999999)
vc_4 = VentureCapitalist.new("Jay-Z", 99999999999999990)


funding_round_1 = FundingRound.new(startup_1, vc_1, "Angel", 1)
funding_round_2 = FundingRound.new(startup_1, vc_2, "Seed", 1)
funding_round_3 = FundingRound.new(startup_1, vc_2, "Angel", 1)
funding_round_4 = FundingRound.new(startup_1, vc_3, "Angel", 1)
funding_round_5 = FundingRound.new(startup_1, vc_4, "Angel", 1)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line