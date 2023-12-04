require 'pry'
def calibration_value(value)
  array = value.chars

  collection = []

  array.each do |character|
    collection.push character.to_i if character.to_i != 0
  end

  "#{collection.first}#{collection.last}".to_i
end

file_data = File.read("input.txt").split

sum = 0

file_data.each do |data|
  sum += calibration_value(data)
end

puts sum
