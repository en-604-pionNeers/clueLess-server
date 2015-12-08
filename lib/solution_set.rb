class SolutionSet
  attr_accessor :weapon_card
  attr_accessor :suspect_card
  attr_accessor :room_card
  
  def initialize(cardset)
    @weapon_card = cardset.random_weapon_card
    @suspect_card = cardset.random_suspect_card
    @room_card = cardset.random_room_card
  end
    
  
end