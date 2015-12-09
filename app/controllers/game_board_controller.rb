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
    $game.start_game
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
    if !$game.game_in_play
      $game.add_player(params[:name], params[:board_piece])
      render json: { players: $game.get_players }
    else
      render json: { error: "Game play in progress. Cannot add a player."}, status: 400
    end
  end

  # Let a player make a move
  def make_move
    player = $game.get_player(params[:player_id])
    valid_move = nil
    error = nil
    if $game.game_in_play && player.player_in_turn
      valid_move = $game.game_board.move_player(player, params[:location_id])
      if valid_move
        $game.update_player_in_turn(params[:player_id])
        # TODO ==== ADD *CHECK BOARD LOGIC* FOR WINNER HERE
      else
        error = "Invalid move. Room not available."
      end
    else
      error = "Game is not in play, or it is not the player's turn."
    end
    if valid_move
      render json: { success: true}
    else
      render json: { error: error}, status: 400
    end
  end
  
  def make_accusation
    player = $game.get_player(params[:player_id])
    if $game.game_in_play && player.player_in_turn
      
      
      #Render if the player has won or if the player has lost
      render json: { success: true}
    end
  end
  
  def make_suggestion
    player = $game.get_player(params[:player_id])
    if $game.game_in_play && player.player_in_turn
      
      
      #Render the cards held by other players
      render json: { success: true}
    end
  end
  
  # Get the number of players
  def get_num_players
    render json: {player_count: $game.get_player_count}
  end
end
