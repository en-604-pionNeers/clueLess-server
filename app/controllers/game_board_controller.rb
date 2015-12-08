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
    render json: { board: $game.game_board}
  end

  # Remove game board
  def destroy
    $game = nil
    head :no_content
  end

  def available_cards
    render json: { available_cards: $game.available_cards }
  end

  # Start the game
  def start_game
    $game.game_in_play = true
    render json: { success: true }
  end

  # Get the current game board status
  def index
    if $game
      render json: { board: $game.game_board}
    else
      head :not_found
    end
  end

  def halls
    render json: { halls: $game.game_board.halls }
  end

  def rooms
    render json: { rooms: $game.game_board.rooms }
  end

  def get_player
    id = params[:id]
    player = $game.get_player(id)
    render json: { player: player}
  end

  # Get which player is in turn
  def get_player_in_turn
    puts "Gets the player that's currently in turn"
    render json: { player: $game.player_in_turn }
  end

  def players
    render json: { players: $game.get_players }
  end

  def add_player_to_game
    # TODO: Add in correct input to method for adding a player
    puts "The params: #{params}"
    $game.add_player(params[:name], params[:board_piece])
    render json: { players: $game.get_players }
  end

  # Let a player make a move
  def make_move
    player = $game.get_player(params[:player_id])
    puts "The player: #{player}"
    response = $game.game_board.move_player(player[0], params[:location_id])
    if response
      render json: { success: true}
    else
      render json: { error: "Room is not vacant. Cannot move player."}, status: 406
    end
  end

  # Get the number of players
  def get_num_players
    render json: {player_count: $game.get_player_count}
  end
end
