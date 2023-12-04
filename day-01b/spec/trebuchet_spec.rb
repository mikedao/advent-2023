require 'rspec'
require './lib/trebuchet'

describe Trebuchet do
  it "can convert things" do
    trebuchet = Trebuchet.new

    result = trebuchet.calibration_value("two1nine")
    expect(result).to eq(29)

    result = trebuchet.calibration_value("eightwothree")
    expect(result).to eq(83)

  end

  it "can convert weird things" do
    trebuchet = Trebuchet.new

    result = trebuchet.calibration_value("eighthree")
    expect(result).to eq(83)

    result = trebuchet.calibration_value("sevenine")
    expect(result).to eq(79)

    result = trebuchet.calibration_value("1sevenine")
    expect(result).to eq(19)

    result = trebuchet.calibration_value("sevenine1")
    expect(result).to eq(71)
  end
end
