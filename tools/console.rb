require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

vc1 = VentureCapitalist.new("name1", 1938281291)
vc2 = VentureCapitalist.new("name2", 938281291)
vc3 = VentureCapitalist.new("name3", 2938281291)
vc4 = VentureCapitalist.new("name4", 3938281291)
vc5 = VentureCapitalist.new("name5", 198281291)

s1 = Startup.new("name1", "founder1", "domain1")
s2 = Startup.new("name2", "founder2", "domain1")
s3 = Startup.new("name3", "founder3", "domain3")
s4 = Startup.new("name4", "founder4", "domain4")
s5 = Startup.new("name5", "founder4", "domain4")

f1 = FundingRound.new(s1, vc1, "type", 1.1)
f2 = FundingRound.new(s1, vc2, "type", 2.1)
f3 = FundingRound.new(s1, vc3, "type", 10.1)
f4 = FundingRound.new(s2, vc1, "type", 200.1)
f5 = FundingRound.new(s2, vc2, "type", 300.1)
f6 = FundingRound.new(s3, vc3, "type", 400.1)
f7 = FundingRound.new(s3, vc1, "type", 10093.3)
f8 = FundingRound.new(s4, vc1, "type", 12311.111)
f9 = FundingRound.new(s4, vc2, "type", 231)
f10 = FundingRound.new(s3, vc3, "type", 123.19)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line