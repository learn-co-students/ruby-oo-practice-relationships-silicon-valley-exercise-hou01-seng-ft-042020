require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console






# startup = (name, founder, domain)
s1 = Startup.new("Duck Tape", "Bob", "www.ducktape.com")
s2 = Startup.new("Ice Cream", "Tim", "www.icecream.com")
s3 = Startup.new("Rubber Ducky", "Allen", "www.rubberducky.com")
s4 = Startup.new("Pepsi", "Alex", "www.pepsi.com")
s5 = Startup.new("Popcorn", "Josh", "www.popcorn.com")

# 
v1 = VentureCapitalist.new("Adam", 1000444555)
v2 = VentureCapitalist.new("Mike", 200612)
v3 = VentureCapitalist.new("Todd", 236612)
v4 = VentureCapitalist.new("Justin", 20033636612)
v5 = VentureCapitalist.new("Joe", 2003336612)


# funding = (type, investment, startup, venture_capitalist)
f1 = FundingRound.new("Angel", 200.00, s1, v3)
f2 = FundingRound.new("Seed", 350.00, s2, v4)
f3 = FundingRound.new("Pre-Seed", 10500.25, s3, v5)
f4 = FundingRound.new("Series A", 1000000000.99, s4, v4)
f5 = FundingRound.new("Angel", 20999.99, s5, v1)
f6 = FundingRound.new("Pre-Seed", 102030, s2, v4)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line