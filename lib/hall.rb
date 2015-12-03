require 'location'

class Hall < Location

  def initialize(name)
    @player=nil
    @name=name
    @vacant=false
  end
end