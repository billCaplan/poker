require_relative 'hand'
require_relative 'display'

class Player
  attr_accessor :balance, :hand

  def initialize(balance)
    @balance = balance
    @display = Display.new
  end

  def test_render
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

julio = Player.new(80000)
julio.test_render
