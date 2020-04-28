class Startup
    attr_reader :founder
    attr_accessor :name, :domain
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all 
    end

    def pivot(new_name, new_domain)
        @name = new_name
        @domain = new_domain 
    end


    def self.found_by_founder(look_founder)
        # return first statup whose founder's name matches
        self.all.find {|startup| startup.founder == look_founder} #
    end

    def self.domains
        # return an array of all the different startup domains
        self.all.map {|startup| startup.domain} 
    end

    def sign_contract(venCap, type, amount)
        #given: venCap object, type/invesment, amount = float
        #create a new funding round  and associate it with that startup and that venCap
        FundingRound.new(self, venCap, type, amount)
    end


    def funding_rounds
        #returns an array of all funding round instances for this startup
        FundingRound.all.select {|x| x.startup == self}
    end

    def num_funding_rounds
        #returns total number of funding rounds that the startup has gotten
        funding_rounds.count
    end

    def total_funds
        #total sum of funding rounds that the startup has gotten
        total = 0
        funding_rounds.each {|fund| total += fund.investment}
        return total
    end


    def investors
        #returns a unique array of all the venture caputalists that have invested in the company
        funding_rounds.map {|fund| fund.venture_capitalist}.uniq
    end

    def big_investors
        #returns a unique array of all the venture capitalist that have invested in this company
        #and are in the Tres Commas club (aka total_worth >1,000,000,000)
        investors.select {|cap| cap.total_worth > 1000000000}
    end



end
