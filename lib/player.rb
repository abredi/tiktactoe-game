class Player
  attr_accessor :players

  def initialize
    @players = []
    @index = 0
  end

  def icon
    icons = %w[* #]
    icons[@index]
  end

  def next_player
    @index += 1
    @index = 0 if @index >= players.length
    @index
  end

  def current_player
    players[@index]
  end
end
