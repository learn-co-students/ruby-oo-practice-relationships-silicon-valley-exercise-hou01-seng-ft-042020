class VentureCapitalist
  attr_accessor :name, :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    self.class.all << self
  end

  def self.all
    @@all 
  end 

  def self.tres_commas_club
    self.all.select do |capitalist|
      capitalist.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end 

  def funding_rounds
    FundingRound.all.select do |round|
        round.vc == self
    end 
  end 

  def portfolio
    self.funding_rounds.map do |round|
        round.startup 
    end.uniq
  end 

  def biggest_investment
    largest_funding = 0
    biggest_round = nil
    self.funding_rounds.each do |round|
       if  round.amount > largest_funding
        largest_funding = round.amount
        biggest_round = round
       end 
    end
    biggest_round
  end 

  def invested(domain)
    total = 0 
    FundingRound.all.map do |round|
        if round.startup.domain == domain
            total += round.amount
        end 
    end 
    return total 
  end 
end
