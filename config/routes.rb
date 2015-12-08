Rails.application.routes.draw do
  # We will most likely have a very simple routes file
  # and have to define them each individually since we aren't
  # Really using a model


  post 'game_board' => 'game_board#create'
  post 'start_game' => 'game_board#start_game'
  post 'player/:player_id/room/:location_id' => 'game_board#make_move'
  post 'player/:name/board_piece/:board_piece' => 'game_board#add_player_to_game'

  get 'player_count' => 'game_board#get_num_player'
  get 'game_board' => 'game_board#index'
  get 'players' => 'game_board#players'
  get 'player/:player_id' => 'game_board#get_player'
  get 'player_in_turn' => 'game_board#get_player_in_turn'
  get 'cards' => 'game_board#available_cards'
  get 'hall' => 'game_board#halls'
  get 'room' => 'game_board#rooms'
  get 'room/:id' => 'game_board#find_room'

  delete 'game_board' => 'game_board#destroy'
end
