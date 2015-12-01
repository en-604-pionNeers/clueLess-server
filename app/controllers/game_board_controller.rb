require 'game'

class GameBoardController < ApplicationController
  # This class will control most of the actions that are needed
  # Within the game
  # Actually logic should be held within separate classes

  # Initialize a new game
  # NOTE: for now, using a global variable that initializes a game
  # Feel free to update this. This was just a starting point
  def create
    $game = Game.new
    render json: { success: true }
  end

  # Start the game
  def start_game

    render json: { success: true }
  end

  # Get the current game board status
  def index
    puts "Will return a lot of board logic"
  end

  # Get which player is in turn
  def get_player_in_turn
    puts "Gets the player that's currently in turn"
    render json: { player: $game.player_in_turn }
  end

  def get_players
    render json: { players: $game.get_all_players }
  end

  def add_player_to_game
    # TODO: Add in correct input to method for adding a player
    $game.add_player
    render json: { players: $game.get_all_players }
  end

  # Let a player make a move
  def make_move
    # TODO add in make move logic
    render json: { success: true}
  end

  # Get the number of players
  def get_num_players
    render json: {player_count: $game.get_player_count}
  end
end
