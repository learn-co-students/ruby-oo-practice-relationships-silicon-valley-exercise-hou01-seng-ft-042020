class Startup
    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @@all << self
        @name = name
        @founder = founder
        @domain = domain
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find{|start| start.founder == founder}
    end

    def self.domains
        self.all.map{|start| start.domain}.uniq
    end

    def sign_contract(vc, type, investment)
        FundingRound.new(self, vc, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.select{|fr| fr.startup == self}.length
    end

    def total_funds
        sum = 0
        FundingRound.all.each do |fr|
            if fr.startup == self
                sum += fr.investment
            end
        end
        sum
    end

    def investors
        x = []
        FundingRound.all.each do |fr|
            if fr.startup == self
                x << fr.venture_capitalist
            end
        end
        x.uniq
    end

    def big_investors
        x = []
        FundingRound.all.each do |fr|
            if fr.startup == self && VentureCapitalist.tres_commas_club.include?(fr.venture_capitalist)
                x << fr.venture_capitalist
            end
        end
        x.uniq
    end
end
