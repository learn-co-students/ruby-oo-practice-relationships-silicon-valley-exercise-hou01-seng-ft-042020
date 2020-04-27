class Startup
    attr_accessor :name, :domain
    attr_reader :founder


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


    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end

    def self.find_by_founder(founder)
        self.all.find{|startup| startup.founder == founder}
    end

    def self.domains
        s = self.all.map{|startup| startup.domain}
        s.uniq
    end

    def sign_contract(venture_capitalist, type, investment) 
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        a = FundingRound.all.select {|f| f.startup == self}
        a.size
    end

    def total_funds 
        result = 0 
        a = FundingRound.all.select {|f| f.startup == self}
        a.each {|f| result += f.investment }
        result 
    end 

    def all_funding_rounds
        FundingRound.all.select {|f| f.startup == self}
    end


    def investors
        a = all_funding_rounds.map {|r| r.venture_capitalist}
        a.uniq
    end

    def big_investors     
        a = investors.select {|v| VentureCapitalist.tres_commas_club.include?(v)}
        a.uniq
    end 





        


end
