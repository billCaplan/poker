require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = build_deck.shuffle
  end

  def build_deck
    suits = [:heart, :diamond, :club, :spade]
    faces = [ 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    cards = []
    suits.each do |suit|
      faces.each do |face|
        cards << Card.new(face, suit)
      end
    end
    cards
  end


end
