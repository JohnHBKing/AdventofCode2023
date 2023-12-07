# calculator.rb


class Cubes
    attr_accessor :limits
    attr_accessor :games
    
    #create
    def initialize(limits, games)
        @games = games
        @limits = limits
    end

    def calculator
        maxes = Array.new
        limitsbyline = @limits.gsub(/and\s+/, "").split(/, /)
        limitsbyline.each do |line|
            colour = line.gsub(/\s+(\w+)\s+/).to_a.join.gsub(/\s+/, "")
            number = line.gsub(/(\d+)/).to_a.join
            limit = colour + number
            maxes.push(limit)
        end
        puts maxes
        counter = 0
        @games.each_line do |game|
            game_ID = game.scan(/Game (\d+)/).to_s
            puts game_ID
            puts game.partition(": ").last
            #counter += game_ID
        end
    end

end