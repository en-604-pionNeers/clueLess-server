require 'board_piece'
require 'room_card'
require 'weapon'

class CardSet

  attr_accessor :available_cards

  def initialize
    puts "Creating Card Set"

    available_weapons = WEAPONS.collect do |weapon_name|
      Weapon.new(weapon_name, weapon_name.to_s.gsub('_', ' ').capitalize)
    end

    available_suspects = PLAYER_PIECES.collect do |suspect_name|
      BoardPiece.new(suspect_name, suspect_name)
    end

    available_rooms = ROOM_LAYOUT[:rooms].collect do |room_map|
      RoomCard.new(room_map[:name], room_map[:name].to_s.gsub('_', ' ').capitalize)
    end


    #Initialize a map of each card type.
    @available_cards = {:weapons => available_weapons,
                        :suspects => available_suspects,
                        :rooms => available_rooms}

    @card_list = available_weapons << available_suspects << available_rooms
  end

  def random_card
    card = @card_list.sample
    card.delete
  end

  #Retrieve a random weapon card and remove it from the weapon map
  def random_weapon_card
    card = available_cards[:weapons].sample
    available_cards[:weapons].delete(card)
  end

  #Retrieve a random suspect card and remove it from the weapon map
  def random_suspect_card
    card = available_cards[:suspects].sample
    available_cards[:suspects].delete(card)
  end

  #Retrieve a random room card and remove it from the weapon map
  def random_room_card
    card = available_cards[:rooms].sample
    available_cards[:rooms].delete(card)
  end
end
