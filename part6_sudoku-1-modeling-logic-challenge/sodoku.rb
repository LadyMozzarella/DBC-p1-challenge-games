require 'pry'
require 'set'

digits = Set.new [1,2,3,4,5,6,7,8,9]

class Tile
  attr_accessor :value, :possibles, :row, :column, :box_number
  def initialize(value)
    @possibles = pop_set(value)
    @value = value
  end

  def pop_set(value)
    if value == "0"
      set = Set.new [1,2,3,4,5,6,7,8,9]
    else
      set = Set.new [value]
    end
    return set
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
  # def assign_boxes

  # end

  def populate_tiles
    @board.each_with_index do |row, row_index|
      row.each_with_index do |this_tile, column_index|
        this_tile.row = row_index
        this_tile.column = column_index
        p this_tile.box_number = (3 * (this_tile.row / 3)) + ((this_tile.column/3) +1)
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



our_board = Board.new()
our_board.set_up("619030040270061008000047621486302079000014580031009060005720806320106057160400030")
our_board.create_tiles
puts "Sudoku Board: "
puts our_board.display
our_board.populate_tiles

# print our_board.board[2][4].row
# print our_board.board[2][4].column

row_values = []
our_board.board[0].each do |tile|
  row_values << tile.value.to_i if tile.value != "0"
end
puts "Going to subtract: #{row_values}"

column_values = []
our_board.board.each do |row|
  column_values << row[3].value.to_i if row[3].value != "0"
end
puts "Going to subtract: #{column_values}"

# puts our_board.board[2][3].possibles
# our_board.board[2][3].eliminate_possibles(row_values)
# our_board.board[2][3].eliminate_possibles(column_values)