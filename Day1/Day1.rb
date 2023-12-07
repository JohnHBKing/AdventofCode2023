#   Day1.rb

require './Day1/calibrator.rb'


puts "This example should be 142"

example = File.read('./Day1/example.txt')

calibrator = Calibrator.new(example)

calibrator.calculator

puts "now for the real thing"

input = File.read('./Day1/input.txt')

calibrator = Calibrator.new(input)

calibrator.calculator


puts "and for part 2"


puts "This example should be 281"

example2 = File.read('./Day1/example2.txt')

calibrator = Calibrator.new(example2)

part2 = calibrator.substitutes


part2 = Calibrator.new(part2)

part2.calculator


puts "now for the real thing"

input = File.read('./Day1/input.txt')

calibrator = Calibrator.new(input)


part2 = calibrator.substitutes

part2 = Calibrator.new(part2)

part2.calculator
