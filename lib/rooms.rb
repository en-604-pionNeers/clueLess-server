require 'location'

class Room < Location
  attr_accessor :halls
  attr_accessor :secret_passage

  def initialize(room)
    @id = room[:id]
    @name = room[:name]
    @halls = room[:halls]
    @players = []
    @secret_passage = room[:secret_passage].nil? ? nil : Integer(room[:secret_passage])
    @vacant = true
  end
end