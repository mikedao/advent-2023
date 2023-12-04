require './lib/game'
require 'pry'

games = []
File.foreach("input.txt") do |line|
  games.push(Game.new(line))
end

sum = 0
games.each do |game|
  sum += game.powers
end

puts sum
