require 'location'

class Hall < Location

  def initialize(name, id)
    @id = id
    @players=[]
    @name=name
    @vacant=true
  end
end