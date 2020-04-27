class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all =[] 
    def initialize(name, total_worth)
        @name = name 
        @total_worth = total_worth
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.tres_commas_club
        self.all.select {|v| v.total_worth >= 1000000000}
    end 

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)    
    end

    def funding_rounds
        FundingRound.all.select {|f| f.venture_capitalist == self}
    end

    def portfolio
        a = funding_rounds.map {|f| f.startup}
        a.uniq
    end

    def biggest_investment
        # a = funding_rounds.map {|f| f.investment}
        # a.index(a.max)
        funding_rounds.max {|a, b| a.investment <=> b.investment}

    end 

    def invested(d)
        total = 0 
        funding_rounds.select do |f| 
            if f.startup.domain == d
                total += f.investment
            end 
        end 
        total 
        
    end 





end
