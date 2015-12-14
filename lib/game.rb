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
  attr_accessor :awaiting_suggest_response
  attr_accessor :suggestion
  attr_accessor :accusation
  attr_accessor :suggest_response
  attr_accessor :winner

  def initialize
    puts "Creating a new game"
    # TODO: Player logic
    @players = {}
    @game_board = Board.new
    @game_in_play = false
    @available_cards = CardSet.new
    @solution_set = SolutionSet.new(@available_cards)
    @awaiting_suggest_response = false
  end

  def add_player(board_piece)
    return if @game_in_play
    @players[@players.count] = (Player.new(@players.count, board_piece))
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
    found_next = false
    
    @players.collect{ |k, v| v}[(Integer(id) + 1)..10].each do |p|
      if p
        if !p.disabled
          found_next = true
          p.player_in_turn = true
          break
        end
      end
    end
    if !found_next
      @players.collect{ |k, v| v}[0..(Integer(id) - 1)].each do |p|
        if p
          if !p.disabled
            found_next = true
            p.player_in_turn = true
            break
          end
        end
      end
    end
    
    if !found_next
      @winner = player
      @game_in_play = false
    end
  end

  def player_in_turn
    @players.each do |key, player|
      return player if player.player_in_turn
    end
  end

  def start_game
    return if @game_in_play
    
    #Distribute remaining cards
    while @available_cards.card_list.length > 0 do
      if @players.length == 0
        break
      end
      @players.each do |key, player|
          card = @available_cards.random_card
          break unless card
          player.cards = player.cards.push(card)
      end
    end

    scarlet = false
    @players.each do |index, player|
      player_name = player.board_piece.item_name.to_s
      player.location_id = PLAYER_PIECES_START[player_name]
      @game_board.halls[player.location_id].occupy_location(player)
      
      if player_name == PLAYER_PIECES[0]
        scarlet = true
        @players[index].player_in_turn = true
      end
    end
    if scarlet == false
      @players[0].player_in_turn = true
    end
    @game_in_play = true
    
  end

end