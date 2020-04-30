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
        self.all.select do |venture_capitalist|
            venture_capitalist.total_worth >= 1000000000
        end
    end

    def offer_contract(startup,venture_capitalist,type,investment)
        FundingRound.new(startup,self,type,investment)
    end

    def funding_rounds
        FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map {|funding_round| funding_round.startup}.uniq
    end

    def biggest_investment
        funding_rounds.map {|funding_round| funding_round.investment}.max
    end

    def invested(domain)
        #return total invested in domain
        funding_rounds.map {|domain| domain.investment}.sum
    end
end
