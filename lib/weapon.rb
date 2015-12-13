require 'card'

class Weapon < Card
  attr_accessor :item_name 

  def initialize(weapon_id, weapon_name)
    super(weapon_id, CardType::WEAPON)
    self.item_name  = weapon_name
  end
end