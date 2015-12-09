require 'location'

class Hall < Location

  def initialize(name, id)
    @id = id
    @player=nil
    @name=name
    @vacant=true
  end
end