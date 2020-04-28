require "pry"

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
        #returns an array of all venture capitalists in the Tres Commans club
        #aka they have more than 1,000,000,000 total worth
        VentureCapitalist.all.select {|cap| cap.total_worth > 1000000000}
    end 

    def offer_contract(startup, type, amount)
        #given: startup object, type of investment, amount invested(float)
        #creates a new funding round and associates it with that startup and venture capitalist
        FundingRound.new(type, amount, startup, self)
    end
        
    def funding_rounds
        #returns an array of all the funding round for that venture capitalist
        FundingRound.all.select {|fund| fund.venture_capitalist == self}
    end

    def portfolio
        #returns a unique list of all startups this venture capitalist has funded
        funding_rounds.map {|fund| fund.startup}.uniq
    end

    def portfolio_by_name   # ** I ADDED**
        #returns a unique list of startups by NAME
        portfolio.map {|startup| startup.name}.uniq
    end

    def biggest_investment  
        #retuns the largest funding round given by this venture capitalist
        funding_rounds.sort{|a,b| a.investment <=> b.investment}
        return funding_rounds[0]
    end

    def all_domain_names # ** I ADDED **
        #returns all the funding rounds of the domains by this venture capitalist 
        funding_rounds.map {|fund| fund.startup.domain}
    end

    def finding_domains(domain_name) # ** I ADDED **
        #returns funding rounds for certain domain names of this venture capitialist
        funding_rounds.select {|fund| fund.startup.domain == domain_name}
    end

    def invested(domain_name)
        #give a domain string, returns the total amount invested in that domain.
        total = 0
        finding_domains(domain_name).map {|fund| total += fund.investment}
        return total
    end




end
