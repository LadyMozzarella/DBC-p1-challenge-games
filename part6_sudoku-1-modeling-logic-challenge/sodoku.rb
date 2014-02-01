require 'pry'
require 'set'

digits = Set.new [1,2,3,4,5,6,7,8,9]

class Tile
  attr_accessor :value, :possibles, :row, :column
  def initialize(value)
    @possibles = pop_set(value)
    @value = value
  end

  def pop_set(value)
    if value == "0"
      set = Set.new [1,2,3,4,5,6,7,8,9]
    end
  end

  def eliminate_possibles(data)
    data.each do |value|
      @possibles.keep_if { |possible|
        possible != value
      }
    end
    puts @possibles.inspect
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

  def populate_tiles
    @board.each_with_index do |row, row_index|
      row.each_with_index do |this_tile, column_index|
        this_tile.row = row_index
        this_tile.column = column_index
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
OurBoard.populate_tiles
