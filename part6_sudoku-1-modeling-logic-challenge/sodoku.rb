require 'pry'
require 'set'

digits = Set.new [1,2,3,4,5,6,7,8,9]

class Board
  def initialize
    @board = []
  end
  def set_up(board_string)
   @board = board_string.chars.to_a.each_slice(9)
  end

  def display
    @board.each do |row|
      p row
    end
  end

end


OurBoard = Board.new()
OurBoard.set_up("619030040270061008000047621486302079000014580031009060005720806320106057160400030")
OurBoard.display

p digits



