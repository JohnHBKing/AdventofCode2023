#   Day2.rb

require './Day2/calculator.rb'



rules = File.read('./Day2/example rules.txt')
games = File.read('./Day2/example.txt')

example1 = Cubes.new(rules, games)

example1.power




rules = File.read('./Day2/example rules.txt')
games = File.read('./Day2/input.txt')

example1 = Cubes.new(rules, games)

example1.calculator
example1.power
