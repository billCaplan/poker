require 'byebug'
require_relative 'card'

class Hand
  def initialize(deck)
    @deck = deck
    @cards = [Card.new(5, :heart), Card.new(6, :heart), Card.new(2, :heart), Card.new(8, :heart), Card.new(9, :heart)]
    #@cards = populate.sort_by {|card| card.face_value}
  end

  def populate
    hand = []
    5.times do
      hand << @deck.shift
    end
    hand
  end

  def hand_strength
  hand_strength = nil
    case @cards
    when straight_flush?
      return 8
    when four_of_a_kind?
      return 7
    when full_house?
      return 6
    when flush?
      return 5
    when straight?
      return 4
    when three_of_a_kind?
      return 3
    when two_pair?
      return 2
    when pair?
      return 1
    when high_card?
      return 0
    end
  end

  def straight_flush?
    return true if flush? && straight?
  end

  def four_of_a_kind?
    result = Hash.new {|h,k| h[k] = 0}
    @cards.each do |card|
      result[card.face_value] += 1
    end

    return true if result.any? {|key, val| result[key] > 3 }

  end

  def full_house?
    #debugger
    result = Hash.new {|h,k| h[k] = 0}
    @cards.each do |card|
      result[card.face_value] += 1
    end
    p result
    if result.any? {|key, val| val == 3 } && result.any? {|key, val| val == 2 }
      return true
    end
    false
  end

  def flush?
    anchor_suit = @cards.first.suit
    return true if @cards.all? {|card| card.suit == anchor_suit}
  end

  def straight?
    #debugger
    anchor_number = @cards.first.face_value
    return true if @cards.all? do |card|

    return false if card.face_value != anchor_number

      anchor_number +=1
    end
    false
  end

  def three_of_a_kind?
    result = Hash.new {|h,k| h[k] = 0}
    @cards.each do |card|
      result[card.face_value] += 1
    end

    return true if result.any? {|key, val| result[key] > 2 }
  end

  def two_pair?
    result = Hash.new {|h,k| h[k] = 0}
    @cards.each do |card|
      result[card.face_value] += 1
    end

    return true if result.select {|key, val| result[key] == 2 }.count == 2
  end

  def one_pair?
    result = Hash.new {|h,k| h[k] = 0}
    @cards.each do |card|
      result[card.face_value] += 1
    end

    return true if result.any? {|key, val| result[key] > 1 }
  end

  def high_card
    return true
  end

end

h = Hand.new("dummy deck")
p h.four_of_a_kind?
p h.two_pair?
p h.flush?
p h.straight?
p h.straight_flush?
p h.full_house?
