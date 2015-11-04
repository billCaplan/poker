require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do

  game = TowersOfHanoi.new

  it "initializes with three arrays" do
    expect(game.towers).to eq([[3, 2, 1], [], []])
  end

  it "returns false when asked if game is over while game ins't over" do
    expect(game.won?).to eq(false)
  end

  it "modifies towers when told to make a move" do
    game.move(0, 2)
    expect(game.towers).to eq([[3, 2], [], [1]])
  end

  it "is able to call render with stub" do
    # old way
    #game.stub(:render).and_return(true)

    #new way
    allow(game).to receive(:render).and_return(true)
    expect(game.render).to eq(true)
  end

end
