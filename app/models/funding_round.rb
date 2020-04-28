require_relative "startup.rb"
require_relative "venture_capitalist"

class FundingRound

    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment
    @@all = []

    def initialize(type, investment, startup, venture_capitalist)
        @startup = startup
        @type = type
        @investment = investment
        @venture_capitalist = venture_capitalist
        @@all << self
    end


    def self.all
        @@all
    end

end
