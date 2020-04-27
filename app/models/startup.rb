class Startup
  attr_accessor :name, :domain
  attr_reader :founder
  @@all = []

  def initialize(name, founder)
    @name = name
    @founder = founder
    self.class.all << self
  end

  def pivot(domain_name, new_name)
    @domain = domain_name
    @name = new_name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder_name)
    self.all.find do |startup|
      startup.founder == founder_name
    end 
  end

  def self.domains
    self.all.map do |this_startup|
      this_startup.domain 
    end 
  end 

  def sign_contract(vc, type, amount)
    FundingRound.new(self, vc, type, amount)
  end 

  def find_investments
    FundingRound.all.select do |this_startup|
      this_startup.startup == self 
    end
  end 

  def num_funding_rounds
    self.find_investments.length
  end 

  def total_funds
    self.find_investments.sum do |investment|
      investment.amount
    end
  end 

  def investors
    self.find_investments.map do |investment|
      investment.vc
    end.uniq
  end 


  def big_investors
    # big_spender = VentureCapitalist.tres_commas_club
    # how_many = big_spender.size
    # #self.investors.select do |person|
    # #  person.
    # #end
    # how_many.times do |
    # self.find_by_founder
    self.investors.map do |investor|
      VentureCapitalist.tres_commas_club.find do |big_spender|
        big_spender == investor
      end
    end.uniq
    
  end


end
