require 'pry'
require 'set'

digits = Set.new [1,2,3,4,5,6,7,8,9]

class Tile
  attr_accessor :value, :possibles
  def initialize(value)
    @possibles = pop_set(value)
    @value = value
  end

  def pop_set(value)
    if value == "0"
      set = Set.new [1,2,3,4,5,6,7,8,9]
    end
  end

end

class Board
  attr_accessor :board
  def initialize
    @board = []
  end

  def set_up(board_string)
   board_string.chars.to_a.each_slice(9) {|slice| @board << slice}
  end

  def create_tiles
    @board.each do |row|
      row.map! do |item|
        Tile.new(item)
      end
    end
  end

  def display
    @board.each do |row|
      row.each do |object|
        print object.value
      end
      puts ""
    end
  end

end


OurBoard = Board.new()
OurBoard.set_up("619030040270061008000047621486302079000014580031009060005720806320106057160400030")
OurBoard.create_tiles
OurBoard.display

# puts OurBoard.board[0][3].value
# puts OurBoard.board[0][3].possibles
# puts OurBoard.board[0][0].value
# puts OurBoard.board[0][0].possibles
# puts digits.inspect

