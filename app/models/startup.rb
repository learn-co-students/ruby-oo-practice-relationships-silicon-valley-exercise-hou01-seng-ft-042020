class Startup
    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []
    @@domains = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
        @@domains << self.domain
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
        self
    end

    def self.find_by_founder(founder_name)
        # FundingRound.all.find {|founders| founders.startup == founder_name}
        @@all.find {|startup| startup.founder == founder_name}
    end

    def self.domains
        # @@all.select {|startup| startup.domain}.uniq
        @@domains.uniq
    end

    def sign_contract(venture, investment_type, amount)
        FundingRound.new(self, venture, investment_type, amount)
    end

    def num_funding_rounds
        FundingRound.all.select {|round| round.startup == self}
    end

    def total_funds
        total = 0
        num_funding_rounds.each {|round| total += round.investment}
        total
    end

    def investors
        num_funding_rounds.map {|round| round.venture_capitalist}.uniq

    end

    def big_investors
        investors.select {|investor| investor.total_worth > 1000000000}.uniq
    end
end
