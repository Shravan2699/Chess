require_relative './board'
require_relative './pieces'

my_board = Board.new
my_board.display_board


#Placing the White pieces on the board
(1..8).each do |pos|
    my_board.board1[6][pos] = Pawn.new(:white)
end

(1..8).each do |pos|
    my_board.board1[1][pos] = Pawn.new(:black)
end


my_board.board1[3][3] = Queen.new(:white)
my_board.board1[4][4] = Queen.new(:black)


# my_board.board1[7][8] = White::WhiteRook.new
# my_board.board1[7][1] = White::WhiteRook.new

# my_board.board1[7][3] = White::WhiteBishop.new
# my_board.board1[7][6] = White::WhiteBishop.new

# my_board.board1[7][2] = White::WhiteKnight.new
# my_board.board1[7][7] = White::WhiteKnight.new



# my_board.board1[7][4] = White::WhiteQueen.new
# my_board.board1[7][5] = White::WhiteKing.new


def move_maker(board)
    p "Which piece would you like to move Player 1?"
    player1_move = gets.chomp
    converted_player1_move = board.convert_from_alphanumeric(player1_move)
    p converted_player1_move
    current = board.board1[converted_player1_move[0]][converted_player1_move[1]]


    possible_moves = []

    if current.instance_of?(Pawn)
        possible_moves = current.move_pawn(board.board1,converted_player1_move)
    elsif current.instance_of?(Rook)
        possible_moves = current.move_rook(board.board1,converted_player1_move)
    elsif current.instance_of?(Bishop)
        possible_moves = current.move_bishop(board.board1,converted_player1_move)
    elsif current.instance_of?(Knight)
        possible_moves = current.move_knight(board.board1,converted_player1_move)
    elsif current.instance_of?(Queen)
        possible_moves = current.move_queen(board.board1,converted_player1_move)
    end

    p possible_moves

    alphanumeric_moves = []
    # if !possible_moves.empty?
    #     possible_moves.each do |move|
    #         alphanumeric_moves.push(board.convert_to_alphanumeric(move))
    #     end
    # end

    if !possible_moves.empty?
        possible_moves.each do |move|
            alphanumeric_move = board.convert_to_alphanumeric(move)
            alphanumeric_moves.push(alphanumeric_move)
        end
    end

    p alphanumeric_moves
    if alphanumeric_moves == []
        p "There are no moves available"
    else
        puts "These are all the possible moves you can make with the selected piece: #{alphanumeric_moves}.\nThere are #{alphanumeric_moves.size} moves available.\nSelect one by entering a valid number"
        selected_move = gets.chomp
        converted_selected_move = possible_moves[selected_move.to_i - 1]
        p "Converted selected move is #{converted_selected_move}"
        board.board1[converted_player1_move[0]][converted_player1_move[1]].make_move(board.board1,converted_player1_move,converted_selected_move)
    end
end    



my_board.display_board


game_over = false
while game_over == false
    move_maker(my_board)
    my_board.display_board
end

# my_board.board1[5][1] = Pawn.new(:black)
# my_board.board1[5][3] = Pawn.new(:black)
# my_board.display_board


p my_board.board1[6][2].move_pawn(my_board.board1,[6,2])

#Need to find a way to input coordinates or numbers instead of choosing a number,its hard to keep track as the number of available moves keeps on increasing
#Need to find a way to implement check and checkmate for the king