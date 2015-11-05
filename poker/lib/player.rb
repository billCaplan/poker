require_relative 'hand'
require_relative 'display'

class Player
  attr_accessor :balance
  attr_reader :hand

  def initialize(balance)
    @balance = balance
    @hand = []
  end

  def hand=(hand)
    p "hand recieved"
    @hand = hand
  end

  def test_render
    @display = Display.new(@hand)
    input = nil
    until input
      @display.render
      input = @display.get_input
      @display.render
    end
    p input
  end
  #
  # def prompt(action)
  #   response =
  #   case action
  #   when :bet
  #     get_bet
  #   when :discard
  #     get_discards
  #   end
  # end
  #
  # def make_bet
  #
  # end
  #
  # def ante
  #
  # end
  #
  #
  #
  # def discard_cards
  #
  # end
  #
  # def fold
  #
  # end
  #
  # def raise
  #
  # end
  #
  # def call
  #
  # end

end

# julio = Player.new(80000)
# julio.test_render
