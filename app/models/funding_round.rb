class FundingRound
    attr_accessor :type, :amount
    @@all = []
    attr_reader :startup, :vc
    def initialize(startup, vc, type, amount)
        @startup = startup
        @vc = vc
        @type = type
        @amount = amount
        @@all << self
    end 

    def investment

    end 

    def self.all
        @@all
    end 
end
