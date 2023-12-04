class Game
  attr_reader :id,
              :max_blue,
              :max_red,
              :max_green,
              :min_blue,
              :min_red,
              :min_green

  def initialize(data)
    @id = generate_id(data)
    @max_blue   = 0
    @max_red    = 0
    @max_green  = 0
    generate_max_cubes(data)
  end

  def generate_id(data)
    data.split(" ")[1].sub(":","").to_i
  end

  def generate_max_cubes(data)
    games = data.split(": ")[1..-1].first.split("; ")
    games.each do |game|
      game.split(", ").each do |cubes|
        thing = cubes.split
        if thing.last == "blue"
          @max_blue = thing.first.to_i if thing.first.to_i > @max_blue
        elsif thing.last == "red"
          @max_red = thing.first.to_i if thing.first.to_i > @max_red
        elsif thing.last == "green"
          @max_green = thing.first.to_i if thing.first.to_i > @max_green
        end
      end
    end
  end 

  def valid?
    @max_red <= 12 && @max_blue <= 14 && @max_green <= 13
  end

  def powers
    @max_red * @max_blue * @max_green
  end
end
