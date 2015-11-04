require "rspec"
require "arrays"

describe "#my_unique" do

  it "removes duplicates from an array" do
    expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
  end

  it "returns a blank array if given a blank array" do
    expect([].my_uniq).to eq([])
  end

  it "raises an error when called on the wrong class" do
    expect { "Qwerty".my_uniq }.to raise_error
  end

end

describe "#two_sum" do

  it "returns all pairs that sum to zero" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end

  it "returns a blank array when no elements sum to zero" do
    expect([1, 2, 3, 4, 5].two_sum).to eq([])
  end

  it "return a blank array when given a blank array" do
    expect([].two_sum).to eq([])
  end
  
end
