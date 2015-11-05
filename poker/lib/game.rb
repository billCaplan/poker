require_relative 'deck'
require_relative 'player'


class Game

  def initialize(*players)
    @deck = Deck.new
    @players = players
    @pot = 0
    @this_round_ante = 5
  end

  def play
    until over?
      deal_cards
      take_bets
      # make changes to players hands / choose cards to give up, add back
      # take bets again
      # evaluate all players hands
      # distribute winnings
      # repopulate deck / delete hands or make a new deck
      # eliminate broke players

    end

  end

  def over?
    false
  end

  def deal_cards
    @players.each do |player|
      player.hand = Hand.new(@deck)
    end
  end

  def take_bets
    @players.each do |player|
      case player.test_render
      when [1, 0] # Done

      when [2, 0] # Raise
        @pot += player.standard_raise(@this_round_ante)
        p @pot
      when [3, 0] # Call
        @pot += player.call(@this_round_ante)
        p @pot
      when [4, 0] # Fold
        @players.remove(player)
        p @players
      end

    end
  end

  def check_pot
    @pot
  end

  def next_player
    @players.push(@players.shift)
    current_player = @players.first
  end

end

a = Player.new(8000)
b = Game.new(a)
b.play
