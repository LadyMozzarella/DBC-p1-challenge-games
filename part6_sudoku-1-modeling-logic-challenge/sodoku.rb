class Board
  def initialize
    @board = Array.new(9, Array.new(9))
  end
  def set_up(string)
    string.split("").each_with_index do |number, index|
      @board[index/9][index % 9] = number
    end

  end

  def display
    @board.each do |row|
      p row
      puts ""
    end
  end

end


OurBoard = Board.new()
OurBoard.set_up("619030040270061008000047621486302079000014580031009060005720806320106057160400030")
p OurBoard.display

