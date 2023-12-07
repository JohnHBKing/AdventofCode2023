#   Day2.rb

require './Day2/calculator.rb'



rules = File.read('./Day2/example rules.txt')
games = File.read('./Day2/example.txt')

example1 = Cubes.new(rules, games)

example1.calculator