Rails.application.routes.draw do
  # We will most likely have a very simple routes file
  # and have to define them each individually since we aren't
  # Really using a model


  post 'game_board' => 'game_board#create'
  post 'start_game' => 'game_board#start_game'
  post 'player/:player_id/location/:location_id' => 'game_board#make_move'
  post 'player' => 'game_board#add_player_to_game'

  get 'player_count' => 'game_board#get_num_player'
  get 'game_board' => 'game_board#index'
  get 'players' => 'game_board#players'
  get 'player/:player_id' => 'game_board#get_player'
  get 'player_in_turn' => 'game_board#get_player_in_turn'
  get 'cards' => 'game_board#available_cards'
  get 'halls' => 'game_board#halls'
  get 'rooms' => 'game_board#rooms'
  get 'rooms/:id' => 'game_board#find_room'

  delete 'game_board' => 'game_board#destroy'
end
