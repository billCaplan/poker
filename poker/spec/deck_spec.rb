require 'rspec'
require 'deck'
# require 'card'

describe Deck do

  lucky_cards = Deck.new

  it "intializes with a deck" do
    expect(lucky_cards.cards).to be_an_instance_of(Array)
  end

  it "initializes with a standard 52 card deck" do
    expect(lucky_cards.cards.count).to be(52)
  end

end
