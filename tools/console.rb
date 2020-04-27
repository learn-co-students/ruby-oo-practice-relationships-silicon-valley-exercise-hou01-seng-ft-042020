require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
start1 = Startup.new("startup1", "founder1", "domain1")
start2 = Startup.new("startup2", "founder2", "domain2")
start3 = Startup.new("startup3", "founder3", "domain3")
start4 = Startup.new("startup4", "founder4", "domain1")


ven1 = VentureCapitalist.new("venture1", 3000000)
ven2 = VentureCapitalist.new("venture2", 60000000000)
ven3 = VentureCapitalist.new("venture3", 10000000)
ven4 = VentureCapitalist.new("venture4", 20000000000)

fun1 = FundingRound.new(start1, ven3, "angel", 40000)
fun2 = FundingRound.new(start2, ven2, "angel", 50000)
fun3 = FundingRound.new(start3, ven2, "angel", 80000)
fun4 = FundingRound.new(start1, ven4, "angel", 30000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line