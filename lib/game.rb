require 'player'

class Game

  attr_accessor :players
  attr_accessor :solution_set

  def initialize
    puts "Creating a new game"
    @players = []
  end

  def add_player
    @players.push(Player.new('test!'))
  end

  def get_player_count
    @players.count
  end

  def get_all_players
    @players
  end

  # TODO: Add in player in turn logic
  def player_in_turn
    @players[0]
  end

  def start_game
    puts "I will begin the game"
  end
end