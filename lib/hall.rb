require 'location'

class Hall < Location

  def initialize(name)
    @name=name
    @vacant=false
  end
end