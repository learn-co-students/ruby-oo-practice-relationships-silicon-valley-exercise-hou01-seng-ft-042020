class VentureCapitalist
  attr_accessor :name, :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select do |vc|
      vc.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select{|fr| fr.venture_capitalist == self}
  end

  def portfolio
        x = []
        FundingRound.all.each do |fr|
            if fr.venture_capitalist == self
                x << fr.startup
            end
        end
        x.uniq
  end

  def biggest_investment
    biggest = 0
    funding_rounds.each do |fr|
        if fr.investment > biggest
            biggest = fr.investment
        end
    end
    funding_rounds.find do |fr|
        fr.investment == biggest
    end
  end

  def invested(dom)
    x = Startup.all.select do |start|
        start.domain == dom
    end
    sum = 0
    x.each do |start|
        sum += start.total_funds
    end
    sum
  end
end
