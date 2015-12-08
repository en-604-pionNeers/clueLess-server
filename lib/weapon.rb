require 'card'

class Weapon < Card
  attr_accessor :weapon_name

  def initialize(weapon_id, weapon_name)
    super(weapon_id, CardType::WEAPON)
    self.weapon_name = weapon_name
  end
end