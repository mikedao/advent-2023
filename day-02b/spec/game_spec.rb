require 'rspec'
require 'pry'
require './lib/game'

describe Game do
  it "can create a game" do
    game = Game.new("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")

    expect(game).to be_a(Game)
  end

  it "can generate an id" do
    game = Game.new("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")
    expect(game.id).to eq(1)

    game = Game.new("Game 23: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")
    expect(game.id).to eq(23)
    
    game = Game.new("Game 100: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")
    expect(game.id).to eq(100)
  end

  it "can count max cubes" do
    game = Game.new("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")

    expect(game.max_blue).to eq(6)
    expect(game.max_red).to eq(4)
    expect(game.max_green).to eq(2)

    game = Game.new("Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red")

    expect(game.max_blue).to eq(6)
    expect(game.max_red).to eq(20)
    expect(game.max_green).to eq(13)
  end

  it "knows if it is valid or not valid, i guess" do
    game = Game.new("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")

    expect(game.valid?).to be true

    game = Game.new("Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue")
    
    expect(game.valid?).to be true

    game = Game.new("Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red")

    expect(game.valid?).to be false
  end

  it "can generate the powers" do
    game = Game.new("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")

    expect(game.powers).to eq(48)

    game = Game.new("Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red")

    expect(game.powers).to eq(630)
  end
end
