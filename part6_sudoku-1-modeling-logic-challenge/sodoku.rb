require 'pry'
require 'set'

digits = Set.new [1,2,3,4,5,6,7,8,9]

class Tile
  attr_accessor :value, :possibles, :row, :column, :box_number
  def initialize(value)
    @possibles = pop_set(value.to_i)
    @value = value
  end

  def pop_set(value)
    if value == 0
      set = Set.new [1,2,3,4,5,6,7,8,9]
    else
      set = Set.new []
    end
    return set
  end

  def eliminate_possibles(data)
    data.each do |value|
      @possibles.keep_if { |possible|
        possible != value
      }
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


  def populate_tiles
    @board.each_with_index do |row, row_index|
      row.each_with_index do |this_tile, column_index|
        this_tile.row = row_index
        this_tile.column = column_index
        this_tile.box_number = (3 * (this_tile.row / 3)) + ((this_tile.column/3) +1)
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
  def elimnate_row_possibles
    @board.each do |row|
      row_values = []
      row.each do |tile|
        row_values << tile.value.to_i
      end
      row.each do |tile|
        tile.eliminate_possibles(row_values)
      end
    end
  end

  def elimnate_column_possibles
    x=0
    while x < 9
      column_values = []
      @board.each do |row|
        column_values << row[x].value.to_i
      end
      @board.each do |row|
        row[x].eliminate_possibles(column_values)
      end
      x+=1
    end
  end

  def eliminate_box_possibles
    box_values = [[],[],[],[],[],[],[],[],[]]
    x = 0
    while x <9
      @board.each do |row|
        row.each do |tile|
          box_values[x] << tile.value.to_i if (tile.box_number == x+1 && tile.value.to_i !=0)
        end
      end
      x += 1

    end

    @board.each do |row|
      row.each do |tile|
        tile.eliminate_possibles(box_values[tile.box_number-1])
      end
    end
  end


  def assign_values
    @board.each do |row|
      row.each do |tile|
        if tile.possibles.length == 1
          tile.value = tile.possibles.to_a[0]
          tile.possibles.delete(tile.value)
        end
      end
    end
  end

  def whats_possible? (row, column)
    return @board[row][column].possibles
  end

  def solved?
    @board.each do |row|
      row.each do |tile|
        return false if tile.value == '0'
      end
    end
    return true
  end

  def solve!
    p "Let's Sudoku this bitch!"
    display
    puts "---------"
    until solved?
      elimnate_row_possibles
      # p "Eliminating rows..."
      #sleep(1)
      elimnate_column_possibles
      # p "Eliminating columns..."
      #sleep(1)
      eliminate_box_possibles
      # p "Eliminating boxes..."
      #sleep(1)
      assign_values
      # p "Assigning values...Box is now:"
      #sleep(1)
    end
    display
    p "BAM."
  end

end



our_board = Board.new()
our_board.set_up("619030040270061008000047621486302079000014580031009060005720806320106057160400030")
our_board.create_tiles
puts "Sudoku Board: "
our_board.display
our_board.populate_tiles
our_board.solve!


our_board2 = Board.new()
our_board2.set_up("005030081902850060600004050007402830349760005008300490150087002090000600026049503")
our_board2.create_tiles
puts "Sudoku Board: "
our_board2.display
our_board2.populate_tiles
our_board2.solve!

puzzles = File.readlines('source/set-01_sample.unsolved.txt')
puzzles.each do |puzzle|
  puzzle.chomp!
  our_board3 = Board.new()
  our_board3.set_up(puzzle)
  our_board3.create_tiles
  puts "Sudoku Board: "
  our_board3.display
  our_board3.populate_tiles
  our_board3.solve!
end


















# p our_board.board[8][8].value

# p our_board.board[2][2].possibles
# p our_board.board[2][2].possibles

# p our_board.board[2][2].possibles

# p our_board.whats_possible?(8,8)

# our_board.board.each do |row|
#   row.each do |tile|
#     p "I am Row[#{tile.row}][#{tile.column}] and I could be: ."
#     p tile.possibles
#   end
# end

# print our_board.board[2][4].row
# print our_board.board[2][4].column

# row_values = []
# our_board.board[0].each do |tile|
#   row_values << tile.value.to_i if tile.value != "0"
# end
# puts "Going to subtract: #{row_values}"

# column_values = []
# our_board.board.each do |row|
#   column_values << row[3].value.to_i if row[3].value != "0"
# end
# puts "Going to subtract: #{column_values}"

# puts our_board.board[2][3].possibles
# our_board.board[2][3].eliminate_possibles(row_values)
# our_board.board[2][3].eliminate_possibles(column_values)