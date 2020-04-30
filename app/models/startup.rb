class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []
    #DOMAINS = []
    def initialize(name, founder)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
        #DOMAINS << domain
    end

    def pivot (domain,name)
        @domain = domain
        @name = name
        #DOMAINS << domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        @@all.find do |startup|
            startup.founder
        end
    end
    
    def self.domains
        self.all.map {|startup| startup.domain}
    end

    def sign_contract(startup,venture_capitalist,type,investment)
        FundingRound.new(self,venture_capitalist,type,investment)
    end

    def fundings
        FundingRound.all.select {|funding_round| funding_round.startup == self}
    end

    def num_funding_rounds
        fundings.count
    end


    def total_funds
        fundings.map {|startup| startup.investment}.sum
    end

    def investors
        fundings.map {|investor| investor.venture_capitalist}.uniq
    end

    def big_investors
        big_investors = investors.select {|venture_capitalist| venture_capitalist.total_worth >= 1000000000}
        big_investors.map {|investor| investor.name}.uniq
    end

end
