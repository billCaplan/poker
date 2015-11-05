require "colorize"
require_relative "cursorable"
require_relative "card"

class Display
  include Cursorable

  def initialize
    @hand = [[Card.new(7, :spade), 2, 3, 5, 6]]
    @cursor_pos = [0, 0]
    @commands = [["Done", "", "", "", ""],
                 ["Raise", "", "", "", ""],
                 ["Call", "", "", "", ""],
                 ["Fold", "", "", "", ""]]
    @board = @commands.unshift(@hand)
  end

  def build_grid
    @board.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: :white }
  end

  def render
    system("clear")
    puts "Console Poker 2k15"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
  end

end

#don't do this, this is terrible
class Array
  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 4) }
  end
end
