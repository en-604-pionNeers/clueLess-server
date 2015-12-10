require 'board_piece'
require 'room_card'
require 'weapon'

class CardSet

  attr_accessor :available_cards
  attr_accessor :card_list

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

    @card_list =  []
    @card_list.push(*available_weapons)
    @card_list.push(*available_suspects)
    @card_list.push(*available_rooms)
  end

  def random_card
    card = @card_list.sample
    card_list.delete(card)
    @available_cards[:weapons].delete(card)
    @available_cards[:suspects].delete(card)
    @available_cards[:rooms].delete(card)
    return card
  end

  #Retrieve a random weapon card and remove it from the weapon map
  def random_weapon_card
    card = available_cards[:weapons].sample
    @available_cards[:weapons].delete(card)
  end

  #Retrieve a random suspect card and remove it from the weapon map
  def random_suspect_card
    card = available_cards[:suspects].sample
    @available_cards[:suspects].delete(card)
  end

  #Retrieve a random room card and remove it from the weapon map
  def random_room_card
    card = available_cards[:rooms].sample
    @available_cards[:rooms].delete(card)
  end
end
