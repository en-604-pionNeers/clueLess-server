require 'player'
require 'board'
require 'card_set'
require 'solution_set'

class Game

  attr_accessor :players
  attr_accessor :solution_set
  attr_accessor :game_board
  attr_accessor :game_in_play
  attr_accessor :available_cards 

  def initialize
    puts "Creating a new game"
    # TODO: Player logic
    @players = []
    @game_board = Board.new
    @game_in_play = false
    @available_cards = CardSet.new
    @solution_set = SolutionSet.new(@available_cards)
  end

  def add_player
    # Add player will work differently, doing this
    # For testing purposes
    @players.push(Player.new('test!', @players.count, @available_cards, 'Ms. Vivienne Scarlet'))
  end

  def get_player_count
    @players.count
  end

  def get_players
    @players
  end

  # return a particular player
  def get_player(id)
    @players.each do |player|
      return player if player.id == id
    end
  end

  # TODO: Add in player in turn logic
  def player_in_turn
    @players[0]
  end

  def start_game
    puts "I will begin the game"
  end
end