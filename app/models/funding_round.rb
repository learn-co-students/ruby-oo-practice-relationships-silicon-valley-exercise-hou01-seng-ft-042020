class FundingRound
    attr_accessor :startup, :venture_capitalist, :type, :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @investment = investment #!(investment.negative?) && investment == Float.superclass ? investment : 0
        @type = type
        @@all << self

    end

    def self.all
        @@all
    end

    # def investment

    # end









end
