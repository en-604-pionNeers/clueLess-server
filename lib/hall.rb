require 'location'

class Hall < Location

  def initialize(name)
    @player=nil
    @name=name
    @vacant=true
  end
end