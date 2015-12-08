

class CardSet

  attr_accessor :available_cards 
  
  def initialize
    puts "Creating Card Set"
    
    available_weapons = ["Candlestick", "Poison", "Rope", "Gloves", "Horseshoe", 
                         "Knife"," Lead Pipe"]
                         
    available_suspects = ["Ms. Vivienne Scarlet", "Col. Michael Mustard", 
                          "Mrs. Blanche White", "Rev. Jonathan Green", 
                          "Mrs. Elizabeth Peacock", "Prof. Peter Plum"]
                          
    available_rooms = ["Kitchen", "Ballroom", "Conservatory", "Billiard Room", 
                       "Library", "Study", "Hall", "Lounge", "Dining Room", 
                       "Cellar"]
    
    
    #Initialize a map of each card type.
    @available_cards = {:weapons => available_weapons,
                        :suspects => available_suspects,
                        :rooms => available_rooms}
  end
  
  #Retrieve a random weapon card and remove it from the weapon map
  def random_weapon_card
    card = available_cards[:weapons].sample
    available_cards[:weapons].delete(card)
    return card
  end
  
  #Retrieve a random suspect card and remove it from the weapon map
  def random_suspect_card
    card = available_cards[:suspects].sample
    available_cards[:suspects].delete(card)
    return card
  end
  
  #Retrieve a random room card and remove it from the weapon map
  def random_room_card
    card = available_cards[:rooms].sample
    available_cards[:rooms].delete(card)
    return card
  end
end
