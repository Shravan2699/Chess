require_relative './board'
require_relative './pieces'

my_board = Board.new
# my_board.display_board


###Placing the White pieces on the board
(1..8).each do |pos|
    my_board.board1[6][pos] = Pawn.new(:white)
end
my_board.board1[7][8] = Rook.new(:white)
my_board.board1[7][1] = Rook.new(:white)
my_board.board1[7][3] = Bishop.new(:white)
my_board.board1[7][6] = Bishop.new(:white)
my_board.board1[7][2] = Knight.new(:white)
my_board.board1[7][7] = Knight.new(:white)
my_board.board1[7][4] = Queen.new(:white)
my_board.board1[7][5] = King.new(:white)

my_board.board1[2][3] = Pawn.new(:white)

###Placing the Black pieces on the board
(1..8).each do |pos|
    my_board.board1[1][pos] = Pawn.new(:black)
end
my_board.board1[0][8] = Rook.new(:black)
my_board.board1[0][1] = Rook.new(:black)
my_board.board1[0][3] = Bishop.new(:black)
my_board.board1[0][6] = Bishop.new(:black)
my_board.board1[0][2] = Knight.new(:black)
my_board.board1[0][7] = Knight.new(:black)
my_board.board1[0][4] = Queen.new(:black)
my_board.board1[0][5] = King.new(:black)


my_board.display_board
def move_maker(board)
    puts "Welcome to Terminal Chess!"
    p "Which piece would you like to move Player 1?"


    player1_move = gets.chomp


    if player1_move == "q"
        puts "Player 1 has quit the game."
        game_over = true
    else
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
        elsif current.instance_of?(King)
            possible_moves = current.move_king(board.board1,converted_player1_move)
        end

        # p possible_moves

        alphanumeric_moves = []

        if !possible_moves.empty?
            possible_moves.each do |move|
                alphanumeric_move = board.convert_to_alphanumeric(move)
                alphanumeric_moves.push(alphanumeric_move)
            end
        end

        # p alphanumeric_moves

        sorted_alphanumeric_moves = alphanumeric_moves.sort
        sorted_possible_moves = []
        sorted_alphanumeric_moves.each do |move|
            sorted_possible_moves.push(board.convert_from_alphanumeric(move))
        end

        # p "These are the sorted_possible_moves : #{sorted_possible_moves}"

        if alphanumeric_moves == []
            p "There are no moves available"
        else
            puts "These are all the possible moves you can make with the selected piece: #{sorted_alphanumeric_moves}.\nThere are #{sorted_alphanumeric_moves.size} moves available.\nSelect one by entering a valid number"
            selected_move = gets.chomp
            if selected_move == "q"
                game_over = true
            else
                converted_selected_move = sorted_possible_moves[selected_move.to_i - 1]
                puts "Converted selected move is #{converted_selected_move}"
                board.board1[converted_player1_move[0]][converted_player1_move[1]].make_move(board.board1,converted_player1_move,converted_selected_move)
            end
            
        end
    end
    # p "Game over is #{game_over}"
    return game_over
end    





game_over = false
while !game_over
    if move_maker(my_board) == true
        game_over = true
        break
    end
    move_maker(my_board)
    my_board.display_board
end


# p my_board.board1[6][2].move_pawn(my_board.board1,[6,2])

