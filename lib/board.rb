class Board
  attr_accessor :board1;@COLUMNS
  def initialize
      @board1 = Array.new(9) { Array.new(9, ' ') }
      @board1[8] = [' ','A','B','C','D','E','F','G','H']

      @COLUMNS = {}
      ('A'..'H').each_with_index do |letter, index|
        @COLUMNS[letter] = index + 1
      end
    
    (1..8).each do |num|
      @board1[num - 1][0] = 9 - num
    end
  end

  def display_board
    @board1.each do |row|
      row_display = row.map do |cell|
        if cell.is_a?(White::WhitePawn) || cell.is_a?(White::WhiteRook) || cell.is_a?(White::WhiteBishop)
          cell.to_s
        else
          cell
        end
      end
      puts row_display.join(' | ')
      puts '-' * (row_display.length * 4 - 1) # Separator line between rows
    end
  end


  def convert_to_alphanumeric(coordinate)
    row_pos = 9 - (coordinate[0] + 1)
    column_pos = @COLUMNS.key(coordinate[1])
    return "#{column_pos}#{row_pos}"
  end

  def convert_from_alphanumeric(char)
    split_char = char.split("")
    # p split_char
    row_pos = 8 - split_char[1].to_i
    column_pos = @COLUMNS[split_char[0].upcase]
    return [row_pos,column_pos]
  end
end


# my_board = Board.new
# my_board.display_board

