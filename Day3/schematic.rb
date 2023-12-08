# calculator.rb


class Schematic
    attr_accessor :plan
    
    #create
    def initialize(plan)
        @plan = plan
    end

    def calculator
        length = @plan.lines.first.length
        height = @plan.lines.length
        line = ""
        counter = 0
        @plan.each_line.with_index do |line, n|
            line.each_char.with_index do |thing, i|
                if (line[[0, i-1].max].match(/\d/).nil? || i == 0) == true && line[i].match(/\d/).nil? == false
                    size = line[i..].match(/^\d+/).to_a.join.size
                    rows = @plan.lines[[0, n-1].max..[height, n+1].min]
                    scem = Array.new(rows).map {|lines| lines.split("\n")}.flatten.map {|lines| lines[[0, i-1].max..[i+size, length].min]}
                    if not(scem.join.match(/[^\\.|\d]/).nil?)
                        counter += line[i..].match(/^\d+/).to_a.join.to_i
                    end
                end
            end
        end
        counter
        puts counter
    end
    
    def gears
        length = @plan.lines.first.length
        height = @plan.lines.length
        counter = 0
        @plan.each_line.with_index do |line, n|
            line.each_char.with_index do |thing, i|
                if thing.match(/[^\\.|\d]/)
                    size = 1
                    rows = @plan.lines[[0, n-1].max..[height, n+1].min]
                    scem = Array.new(rows).map {|lines| lines.split("\n")}.flatten.map {|lines| lines[[0, i-1].max..[i+size, length].min]}
                    if scem.join.match?(/[^\\.|\d]/)
                        gears = 0
                        calc = scem.join
                        calc[5] = calc[5]+"."
                        calc[2] = calc[2]+"."
                        if calc.match?(/.*\d+.*[^\\.|\d].*\d+.*/) || calc.match?(/.*\d+.+\d+.*[^\\.|\d].*/) || calc.match?(/.*[^\\.|\d].*\d+.+\d+.*/)
                            test = rows.map {|item| item.split("")}
                            yes = test.map {|item| item.values_at i }.flatten.map{|item| item.match?(/\d/)}
                            gears = 1
                            if yes[0] == false
                                if rows[0][[0, i-1].max].match?(/\d/)
                                    j = i
                                    while j >= 0 && rows[0][[0, j].max].match?(/\d/)
                                        start_of_string = j
                                        j -= 1
                                    end
                                    number = rows[0][start_of_string..].match(/\d+/)[0].to_i
                                    gears *= number
                                end
                                if rows[0][[0, i+1].max].match?(/\d/)
                                    number = rows[0][i+1..].match(/\d+/)[0].to_i
                                    gears *= number
                                end
                            elsif rows[0][[0, i].max].match?(/\d/)
                                j = i
                                while j >= 0 && rows[0][[0, j].max].match?(/\d/)
                                    start_of_string = j
                                    j -= 1
                                end
                                number = rows[0][start_of_string..].match(/\d+/)[0].to_i
                                gears *= number
                            end
                            #puts "let's go #{yes[2]} #{rows}"
                            if yes[2] == false
                                if rows[2][[0, i-1].max].match?(/\d/)
                                    j = i
                                    while j >= 0 && rows[2][[0, j].max].match?(/\d/)
                                        start_of_string = j
                                        j -= 1
                                    end
                                    number = rows[2][start_of_string..].match(/\d+/)[0].to_i
                                    gears *= number
                                end
                                if rows[2][[0, i+1].max].match?(/\d/)
                                    number = rows[2][i+1..].match(/\d+/)[0].to_i
                                    gears *= number
                                end
                            elsif rows[2][[0, i].max].match?(/\d/)
                                    j = i
                                    while j >= 0 && rows[2][[0, j].max].match?(/\d/)
                                        start_of_string = j
                                        j -= 1
                                    end
                                    number = rows[2][start_of_string..].match(/\d+/)[0].to_i
                                    gears *= number
                            end

                                if rows[1][[0, i-1].max].match?(/\d/)
                                    j = i
                                    while j >= 0 && rows[1][[0, j].max].match?(/\d/)
                                        start_of_string = j
                                        j -= 1
                                    end
                                    number = rows[1][start_of_string..].match(/\d+/)[0].to_i
                                    gears *= number
                                end
                                if rows[1][[0, i+1].max].match?(/\d/)
                                    number = rows[1][i+1..].match(/\d+/)[0].to_i
                                    gears *= number
                                end
                        end
                        counter += gears
                    end
                end
            end
        end
        counter
        puts counter
    end
end