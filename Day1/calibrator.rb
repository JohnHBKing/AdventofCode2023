#   calibrator.rb




class Calibrator
    attr_accessor :page

    # Create the object
    def initialize(page)
        @page = page
    end

    def substitutes
        @page.each_char.with_index do |char, index|
            if char =="o" && @page[index..index+2]=="one"
                    @page[index..index+2]="o1e"
                elsif char =="t" && @page[index..index+2]=="two"
                    @page[index..index+2]="t2o"
                elsif char =="t" && @page[index..index+4]=="three"
                    @page[index..index+4]="t3  e"
                elsif char =="f" && @page[index..index+3]=="four"
                    @page[index..index+3]="f4 r"
                elsif char =="f" && @page[index..index+3]=="five"
                    @page[index..index+3]="f5 e"
                elsif char =="s" && @page[index..index+2]=="six"
                    @page[index..index+2]="s6x"
                elsif char =="s" && @page[index..index+4]=="seven"
                    @page[index..index+4]="s7  n"
                elsif char =="e" && @page[index..index+4]=="eight"
                    @page[index..index+4]="e8  t"
                elsif char =="n" && @page[index..index+3]=="nine"
                    @page[index..index+3]="n9 e"
                elsif char =="z" && @page[index..index+3]=="zero"
                    @page[index..index+3]="z0 o"
            end
        end
        puts @page
        @page

    end


    #calculates
    def calculator
        counter = 0
        @page.each_line do |line|
            baseline = counter
            if line.scan(/\d/).size == 1
                counter += 11*line.scan(/\d/).map(&:to_i).sum
            else
                counter += 10*line.scan(/\d/).map(&:to_i).first.to_i + line.scan(/\d/).map(&:to_i).last.to_i
            end
            puts counter-baseline
        end

        puts counter
        counter
    end
end



