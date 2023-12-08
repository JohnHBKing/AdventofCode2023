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

        greenballsmax = 0
        blueballsmax = 0
        redballsmax = 0
        
        @limits.gsub(/and\s+/, "").split(/, /).each do |line|
            colour = line.gsub(/\s+(\w+)\s+/).to_a.join.gsub(/\s+/, "")
            number = line.gsub(/(\d+)/).to_a.join.to_i
            if colour == "green"
                greenballsmax = number
            elsif colour == "blue"
                blueballsmax = number
            elsif colour == "red"
                redballsmax = number
            end
        end

        gamecounter = 0
        ngames =  @games.lines.count
        @games.each_line do |game|
            game_ID = game.scan(/Game (\d+)/).flatten.first.to_i
            game.partition(": ").last.split("; ").each do |draw|
                prev_balls = 0
                greenballs = 0
                blueballs = 0
                redballs = 0
                draw.scan(/\w+/).to_a.each_with_index do |balls, i|
                    if balls == "green"
                        greenballs += prev_balls
                    elsif balls == "blue"
                        blueballs += prev_balls
                    elsif balls == "red"
                        redballs += prev_balls
                    else
                        prev_balls = balls.to_i
                    end
                end
                if greenballs > greenballsmax || blueballs > blueballsmax || redballs > redballsmax
                    gamecounter += game_ID
                    break
                end
            end
        end
        score = ngames*(ngames+1)/2 - gamecounter
        puts score
    end

    def power
        power = 0
        @games.each_line do |game|
            greenballs = 1
            blueballs = 1
            redballs = 1
            game.partition(": ").last.split("; ").each do |draw|
                prev_balls = 0
                draw.scan(/\w+/).to_a.each_with_index do |balls, i|
                    if balls == "green"
                        greenballs = [greenballs, prev_balls].max
                    elsif balls == "blue"
                        blueballs= [blueballs, prev_balls].max
                    elsif balls == "red"
                        redballs = [redballs, prev_balls].max
                    else
                        prev_balls = balls.to_i
                    end
                end
            end
            power += greenballs*blueballs*redballs
            
        end
        power
        puts power
    end

end