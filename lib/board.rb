
class Board
    attr_accessor :board1
    def initialize
        @board1 = Array.new(9) { Array.new(9, ' ') }
        @board1[8] = [' ','A','B','C','D','E','F','G','H']

      (1..8).each do |num|
        @board1[num - 1][0] = 9 - num
      end
    end

    def display_board
        @board1.each do |row|
            puts row.join(' | ')
            puts '-' * (row.length * 4- 1) # Separator line between rows
        end
    end
end


# my_board = Board.new
# my_board.display_board

