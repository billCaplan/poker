class Card

  attr_reader :face_value, :suit

  def initialize(face_value, suit)
    @face_value = face_value
    @suit = suit
  end

  def inspect
    { "face value:" => @face_value, "suit:" => @suit}.inspect
  end

  def to_s
    "#{@suit}: #{@face_value}"

  end



end
