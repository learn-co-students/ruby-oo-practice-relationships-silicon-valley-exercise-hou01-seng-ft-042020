require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


f1 = "Edwin"
s1 = Startup.new("Air",f1)
s1.domain = "air.com"
v1 = VentureCapitalist.new("lili",5000000000)
v2 = VentureCapitalist.new("gaby",500)
fr1 = FundingRound.new(s1,v1,"Angel",100)
fr2 = FundingRound.new(s1,v2,"Seed B",400)
fr3 = FundingRound.new(s1,v1,"Seed B",600)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line