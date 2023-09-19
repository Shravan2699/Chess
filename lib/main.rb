require_relative './board'
require_relative './pieces'

my_board = Board.new
my_board.display_board


def move_maker(board)
    p "Which piece would you like to move Player 1?"
    player1_move = gets.chomp
    converted_player1_move = board.convert_from_alphanumeric(player1_move)

    possible_moves = []
    if board.board1[converted_player1_move[0]][converted_player1_move[1]].instance_of?(White::WhitePawn)
        possible_moves = board.board1[converted_player1_move[0]][converted_player1_move[1]].move_pawn(board.board1,converted_player1_move)
    elsif board.board1[converted_player1_move[0]][converted_player1_move[1]].instance_of?(White::WhiteRook)
        possible_moves = board.board1[converted_player1_move[0]][converted_player1_move[1]].move_rook(board.board1,converted_player1_move)
    elsif board.board1[converted_player1_move[0]][converted_player1_move[1]].instance_of?(White::WhiteBishop)
        possible_moves = board.board1[converted_player1_move[0]][converted_player1_move[1]].move_bishop(board.board1,converted_player1_move)
    else
      return "Please select a valid piece..."
    end


    alphanumeric_moves = []
    if !possible_moves.empty?
        possible_moves.each do |move|
            alphanumeric_moves.push(board.convert_to_alphanumeric(move))
        end
    end
    p alphanumeric_moves
    if alphanumeric_moves == []
        p "There are no moves available"
    else
        p "These are all the possible moves you can make with the selected piece: #{alphanumeric_moves}.Select one by entering a valid number"
        selected_move = gets.chomp
        converted_selected_move = possible_moves[selected_move.to_i - 1]
        p "Converted selected move is #{converted_selected_move}"
        board.board1[converted_player1_move[0]][converted_player1_move[1]].make_move(board.board1,converted_player1_move,converted_selected_move)
    end
end
  
(1..8).each do |pos|
    my_board.board1[6][pos] = White::WhitePawn.new
end

my_board.board1[7][8] = White::WhiteRook.new
my_board.board1[7][1] = White::WhiteRook.new

my_board.board1[7][3] = White::WhiteBishop.new
my_board.board1[7][6] = White::WhiteBishop.new




# my_board.board1[5][2] = White::WhiteRook.new
my_board.display_board
# p my_board.board1


game_over = false
while game_over == false
    move_maker(my_board)
    my_board.display_board
end