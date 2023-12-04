require 'pry'
class Trebuchet
  def replace(value)
    value.gsub!("one", "1")
    value.gsub!("two", "2")
    value.gsub!("three", "3")
    value.gsub!("four", "4")
    value.gsub!("five", "5")
    value.gsub!("six", "6")
    value.gsub!("seven", "7")
    value.gsub!("eight", "8")
    value.gsub!("nine", "9")
    value
  end 

  def calibration_value(value)
    value.gsub!("oneight", "18")
    value.gsub!("twone", "21")
    value.gsub!("threeight", "38")
    value.gsub!("fiveight", "58")
    value.gsub!("sevenine", "79")
    value.gsub!("eightwo", "82")
    value.gsub!("eighthree", "83")
    value.gsub!("nineight", "98")
  
    result = ""

    value.chars.each do |letter|
      result += letter
      result = replace(result)
    end

    collection = []

    result.chars.each do |character|
      collection.push character.to_i if character.to_i != 0
    end

    "#{collection.first}#{collection.last}".to_i
  end
end

trebuchet = Trebuchet.new

file_data = File.read("input.txt").split

sum = 0

file_data.each do |data|
  sum += trebuchet.calibration_value(data)
end

puts sum


