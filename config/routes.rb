Rails.application.routes.draw do
  # We will most likely have a very simple routes file
  # and have to define them each individually since we aren't
  # Really using a model


  post 'game_boards' => 'game_board#create'
  post 'game_boards/start_game' => 'game_board#start_game'
  post 'players/:player_id/move' => 'game_board#make_move'
  post 'players/:player_id/suggest' => 'game_board#make_suggestion'
  post 'players/:player_id/accuse' => 'game_board#make_accusation'
  post 'players/:player_id/end_turn' => 'game_board#end_turn'
  post 'players/:player_id/answer_suggestion' => 'game_board#answer_suggestion'
  post 'players' => 'game_board#add_player_to_game'

  get 'players/count' => 'game_board#get_num_player'
  get 'game_boards' => 'game_board#index'
  get 'game_boards/updates' => 'game_board#updates'
  get 'game_boards/:game_id' => 'game_board#get_game'
  get 'players' => 'game_board#players'
  get 'players/:player_id' => 'game_board#get_player'
  get 'player_in_turn' => 'game_board#get_player_in_turn'
  get 'suggested_cards' => 'game_board#suggested_cards'
  get 'cards' => 'game_board#cards'
  get 'halls' => 'game_board#halls'
  get 'rooms' => 'game_board#rooms'
  get 'weapon_cards' => 'game_board#weapon_cards'
  get 'suspect_cards' => 'game_board#suspect_cards'
  get 'location_cards' => 'game_board#location_cards'
  get 'rooms/:id' => 'game_board#find_room'

  delete 'game_boards' => 'game_board#destroy'
end
