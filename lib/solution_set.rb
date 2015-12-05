class SolutionSet
  attr_accessor :weapon_card
  attr_accessor :suspect_card
  attr_accessor :room_card
  
  def initialize(cardset)
    @weapon_card = cardset.getRandomWeaponCard
    @suspect_card = cardset.getRandomSuspectCard
    @room_card = cardset.getRandomRoomCard
  end
    
  
end