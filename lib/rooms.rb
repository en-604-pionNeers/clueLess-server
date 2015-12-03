require 'location'

class Room < Location
  attr_accessor :halls
  attr_accessor :secret_passage

  def initialize(room)
    @name = room[:name]
    @halls = room[:halls]
    @secret_passage = room[:secret_passage]
    @vacant = true
  end
end