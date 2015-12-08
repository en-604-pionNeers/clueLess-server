Rails.application.routes.draw do
  # We will most likely have a very simple routes file
  # and have to define them each individually since we aren't
  # Really using a model


  post 'game_board' => 'game_board#create'
  post 'start_game' => 'game_board#start_game'
  post 'make_move' => 'game_board#make_move'

  put 'add_player' => 'game_board#add_player_to_game'

  get 'player_count' => 'game_board#get_num_player'
  get 'game_board' => 'game_board#index'
  get 'players' => 'game_board#players'
  get 'player/:player_id' => 'game_board#get_player'
  get 'player_in_turn' => 'game_board#get_player_in_turn'

  delete 'game_board' => 'game_board#destroy'
end
