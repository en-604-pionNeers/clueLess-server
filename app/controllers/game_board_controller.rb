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
    render json: $game.game_board.to_json_map
  end

  # Remove game board
  def destroy
    $game = nil
    head :no_content
  end

  def cards
    #Initialize a map of each card type.
    cards = {:weapons => $game.available_cards.available_cards[:weapons],
             :suspects => $game.available_cards.available_cards[:suspects],
             :rooms => $game.available_cards.available_cards[:rooms]}
    render json: cards
  end

  # Start the game
  def start_game
    if !$game.game_in_play
      $game.start_game
      puts $game.solution_set.weapon_card.name
      puts $game.solution_set.suspect_card.name
      puts $game.solution_set.room_card.name
      render json: {success: true}
    else
      error = "Game already in play!"
      render json: {error: error}, status: 400
    end
  end

  # Get the current game board status
  def index
    if $game
      game_map = $game.game_board.to_json_map
      game_map[:game_in_play] = $game.game_in_play
      game_map[:awaiting_suggest_response] = $game.awaiting_suggest_response
      game_map[:suggestion] = $game.suggestion
      game_map[:suggest_response] = $game.suggestion
      render json: [game_map]
    else
      render json: []
    end
  end
  
    # Get the current game board status
  def updates
    if $game
      game_map = {}
      game_map[:board] = $game.game_board.to_json_map
      game_map[:game_in_play] = $game.game_in_play
      game_map[:awaiting_suggest_response] = $game.awaiting_suggest_response
      game_map[:suggestion] = $game.suggestion
      game_map[:suggest_response] = $game.suggest_response
      game_map[:accusation] = $game.accusation
      game_map[:players] = $game.players.collect{|k,v| v}
      game_map[:winner] = $game.winner
      render json: [game_map]
    else
      render json: []
    end
  end

  def halls
    render json: $game.game_board.halls.collect{|k,v| v}
  end

  def rooms
    render json: $game.game_board.rooms.collect{|k,v| v}
  end
  
  def weapon_cards
     render json: $game.available_cards.available_cards[:weapons]
  end
  
  def suspect_cards
    render json: $game.available_cards.available_cards[:suspects]
  end
  
  def location_cards
    render json: $game.available_cards.available_cards[:rooms]
  end
  
  def solution_set
    solution = []
    solution.push($game.solution_set.weapon_card)
    solution.push($game.solution_set.suspect_card)
    solution.push($game.solution_set.room_card)
    render json: solution
  end
  
  def get_player
    id = params[:player_id]
    player = $game.get_player(id)
    render json: player
  end
  
  def end_turn
    id = params[:player_id]
    player = $game.get_player(id)
    if player.player_in_turn
      $game.update_player_in_turn(id)
      $game.suggest_response = nil
      $game.suggestion = nil
      $game.accusation = nil
      render json: {success: true}
    else
      error = "It is not the player's turn."
      render json: {error: error}, status: 400
    end
  end

  def get_game
    id = params[:id]
  end

  # Get which player is in turn
  def get_player_in_turn
    puts "Gets the player that's currently in turn"
    render json: {player: $game.player_in_turn}
  end

  def players
    render json: $game.get_players.collect { |k, v| v }
  end

  def add_player_to_game
    # TODO: Add in correct input to method for adding a player
    if !$game.game_in_play
      $game.add_player(params[:board_piece])
      render json: $game.get_players.collect { |k, v| v }
    else
      render json: {error: "Game play in progress. Cannot add a player."}, status: 400
    end
  end

  # Let a player make a move
  def make_move
    player = $game.get_player(params[:player_id])
    previous = player.location_id
    location_id = params[:location_id]
    valid_move = nil
    error = nil
    if $game.game_in_play && player.player_in_turn
      valid_move = $game.game_board.move_player(player, location_id)
      if valid_move
        #Move does not end game
        #$game.update_player_in_turn(player)
        # TODO ==== ADD *CHECK BOARD LOGIC* FOR WINNER HERE
      else
        error = "Invalid move. Room not available."
      end
    else
      error = "Game is not in play, or it is not the player's turn."
    end
    if valid_move
      render json: {success: true}
      player.previous_moves.push({ :player => player.id, :move => "move", :status => {:from => previous, :to => location_id}})
    else
      render json: {error: error}, status: 400
    end
  end

  def make_accusation
    player = $game.get_player(params[:player_id])
    weapon = params[:weapon_id]
    suspect = params[:suspect_id]
    room = params[:location_id]

    result_cards = []
    card_list = []
    card_list.push(*$game.available_cards.available_cards[:weapons])
    card_list.push(*$game.available_cards.available_cards[:suspects])
    card_list.push(*$game.available_cards.available_cards[:rooms])
    
    card_list.each do |c|
      if(c.name.to_s == weapon || c.name.to_s == suspect || c.name.to_s == room)
        result_cards.push(c)
      end
    end
    
    results = {:cards => result_cards, :from => player}
    
    $game.accusation = results

    if $game.game_in_play && player.player_in_turn
      if $game.solution_set.weapon_card.name.to_s == weapon &&
        $game.solution_set.room_card.name.to_s == room &&
        $game.solution_set.suspect_card.name.to_s == suspect
        #Render if the player has won
        $game.game_in_play = false
        $game.winner = player
        render json: {success: true}
      else
        player.disabled = true
        
        player_list = $game.get_players.collect { |k, v| v }
        player_list.delete(player)
        player_list.each do |p|
          if p.disabled
            player_list.delete(p)
          end
        end
        if player_list.count == 1
          $game.game_in_play = false
          $game.winner = player_list[0]
        else
          $game.update_player_in_turn(player.id)
          $game.suggest_response = nil
          $game.suggestion = nil
        end
        
        #Render if the player has lost
        render json: {success: false}
      end
    end
  end
  
  def answer_suggestion
    card_id = params[:card_id]
    player = $game.get_player(params[:player_id])
    card = nil
    if player.id == $game.suggestion[:player].id
      
      #Has to be an easier way to do this
      card_list = []
      card_list.push(*$game.available_cards.available_cards[:weapons])
      card_list.push(*$game.available_cards.available_cards[:suspects])
      card_list.push(*$game.available_cards.available_cards[:rooms])
      
      card_list.each do |c|
        if c.name.to_s == card_id
          card = c
          break
        end 
      end
      $game.suggest_response = {:card => card, :player => player}
      $game.awaiting_suggest_response = false
      $game.suggestion = nil
      render json: {success: true}
    else
      render json: {success: false}
    end
  end

  def make_suggestion
    player = $game.get_player(params[:player_id])
    if $game.game_in_play && player.player_in_turn
      weapon = params[:weapon_id]
      suspect = params[:suspect_id]
      room = params[:location_id]

      results = []
      
      location_id = nil
      
      $game.game_board.rooms.collect{|k,v| v}.each do |r|
        if r.name == room
          location_id = r.id
          break
        end
      end
      
      playerlist = []
      playerlist.push(*$game.get_players.collect { |k, v| v }[Integer(player.id)..10])
      playerlist.push(*$game.get_players.collect { |k, v| v }[0..Integer(player.id - 1)])
      
      result_cards = []
      card_list = []
      card_list.push(*$game.available_cards.available_cards[:weapons])
      card_list.push(*$game.available_cards.available_cards[:suspects])
      card_list.push(*$game.available_cards.available_cards[:rooms])
      
      card_list.each do |c|
        if(c.name.to_s == weapon || c.name.to_s == suspect || c.name.to_s == room)
          result_cards.push(c)
        end
      end
      results = {:player => nil, :cards => result_cards, :from => player}
      playerlist.each do |p|
        #If this player is the one that is in the suggestion, move him to the room
        if p.board_piece.name == suspect
          $game.game_board.move_player(p, location_id)
        end
        
        if p.id != player.id
          p.cards.each do |c|
            if (c.name.to_s == weapon || c.name.to_s == suspect || c.name.to_s == room)
              $game.awaiting_suggest_response = true
              results[:player] = p
              break
            end
          end
        end
      end
      $game.suggestion = results
      player.previous_moves.push({ :player => player.id, :move => "suggest", :status => {:cards => [weapon,suspect,room]}})
      #Render the cards held by other players
      render json: results
    end
  end
  
  def suggested_cards
    player = $game.player_in_turn
    render json: {:suggestion => $game.suggestion, :from => player}
  end

  # Get the number of players
  def get_num_players
    render json: {player_count: $game.get_player_count}
  end
end
