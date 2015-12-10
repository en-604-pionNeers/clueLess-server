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
  attr_accessor :id

  def initialize
    puts "Creating a new game"
    # TODO: Player logic
    @players = {}
    @game_board = Board.new
    @game_in_play = false
    @available_cards = CardSet.new
    @solution_set = SolutionSet.new(@available_cards)
  end

  def add_player(name, board_piece)
    @players[@players.count] = (Player.new(name, @players.count, @available_cards, board_piece))
  end

  def get_player_count
    @players.count
  end

  def get_players
    @players
  end

  # return a particular player
  def get_player(id)
    return players[Integer(id)]
  end

  def update_player_in_turn(id)
    player = get_player(id)
    player.player_in_turn = false
    if @players[Integer(id) + 1]
      @players[Integer(id) + 1].player_in_turn = true
    else
      @players[0].player_in_turn = true
    end
  end

  # TODO: Add in player in turn logic
  def player_in_turn
    @players.each do |key, player|
      return player if player.player_in_turn
    end
  end

  def start_game
    return if @game_in_play

    # TODO figure out how to assign random cards.
    @players.each do |player|
      card = available_cards.random_card
      break unless card

      player.cards = player.cards + card
    end
    @game_in_play = true
    @players[0].player_in_turn = true
  end

end