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
        @@all.select {|ventures| ventures.total_worth > 1000000000 }
    end

    def offer_contract(startup, investment_type, amount)
        FundingRound.new(startup, self, investment_type, amount)
    end

    def funding_rounds 
        FundingRound.all.select{|fundingrounds| fundingrounds.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map{|fundingrounds| fundingrounds.startup}.uniq
    end

    def biggest_investment 
        funding_rounds.max_by{|funding_rounds| funding_rounds.investment}
    end

    def invested(domain_str)
        total = 0
        funding_rounds.map do |funding_rounds|
            if funding_rounds.startup.domain == domain_str
                total += funding_rounds.investment
            end
        total
        end
    end

end
