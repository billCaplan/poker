require 'rspec'
require 'card'

describe Card do

  it "creates a card with suit" do
    card = Card.new(7, :spade)
    expect(card.suit).to be(:spade)
  end

  it "creates a card with a face value" do
    card = Card.new(7, :spade)
    expect(card.face_value).to be(7)
  end

end
