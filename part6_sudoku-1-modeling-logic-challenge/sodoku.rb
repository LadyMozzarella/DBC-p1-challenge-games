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
      row.each_with_index do |object, column_index|
        object.row = row_index
        object.column = column_index
      end

    end
  end

  def possibles?(row,colum)
    not_possible = []
    not_possible << @board[row][1..8].value
    not_possible << @board[1..8][column].value


    @board[row][column].possibles.reject(not_possible) #every other value in column
  # def get_rows
  #   rows = Hash.new
  #   @board.each_with_index do |row, index|
  #     row_values = []
  #     row.each do |object|
  #       if object.value.to_i != 0
  #         row_values << object.value.to_i
  #       end
  #     end
  #     rows[index] = row_values
  #   end
  #   puts rows
  # end


  # def eliminate_possibles
  #   @board.each do |row|
  #     row.each do |object|
  #       object.possibles.reject
  # end
# 0..8.each do |y|
#   @board[y[0].value
# 0..8.each do |x|
#   @board[0][x].value


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
# p OurBoard.board[2][2].row
# p OurBoard.board[2][2].column
# p OurBoard.board[2][2].value

puts OurBoard.board[0][3].value
puts OurBoard.board[0][3].possibles
#OurBoard.board[0][3].eliminate_possibles(@OurBoard[0])
# test_row_array =[]
# # OurBoard.board[0].each do |object|
# #   test_row_array << object.value.to_i
# # end
# p test_row_array
# puts OurBoard.board[0][3].eliminate_possibles(test_row_array)
# p OurBoard.board[0][3].eliminate_possibles(@board.row_values)

puts OurBoard.get_rows

