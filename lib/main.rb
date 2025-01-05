#Only if the move is valid,ask the other player to select their piece,or else keep on asking the same player untill valid move
#Need to implement checkmate for the King

require_relative './board'
require_relative './pieces'


class Player
    attr_accessor :name, :color, :board


    def initialize(name,color,board)
        @name = name
        @board = board
        @color = color
        @game_over = false
    end



    def move(board)
        loop do
          puts "Which piece would you like to move, #{@name}"
          selected_piece = gets.chomp
      
          if selected_piece == "q"
            puts "Player has quit the game."
            @game_over = true
            return
          else
            converted_selected_piece = board.convert_from_alphanumeric(selected_piece)
            puts "This is converted_selected_piece: #{converted_selected_piece}"
            if board.board1[converted_selected_piece[0]][converted_selected_piece[1]] == " "
                puts "Invalid move!Try again"
            elsif board.board1[converted_selected_piece[0]][converted_selected_piece[1]].color == color
              current = board.board1[converted_selected_piece[0]][converted_selected_piece[1]]
              possible_moves = []
      
              case current
              when Pawn
                possible_moves = current.move_pawn(board.board1, converted_selected_piece)
              when Rook
                possible_moves = current.move_rook(board.board1, converted_selected_piece)
              when Bishop
                possible_moves = current.move_bishop(board.board1, converted_selected_piece)
              when Knight
                possible_moves = current.move_knight(board.board1, converted_selected_piece)
              when Queen
                possible_moves = current.move_queen(board.board1, converted_selected_piece)
              when King
                possible_moves = current.move_king(board.board1, converted_selected_piece)
              end
      
              if possible_moves.empty?
                puts "Invalid move! Try again."
              else
                converted = possible_moves.map { |move| board.convert_to_alphanumeric(move) }
      
                puts "Valid moves: #{converted.join(', ')}"
                puts "Select one by entering a valid move (e.g., A2 to B3):"
                selected_move = gets.chomp
      
                if selected_move == "q"
                  puts "#{@name} quit"
                  @game_over = true
                  return
                end
      
                converted_selected_move = board.convert_from_alphanumeric(selected_move)
      
                if possible_moves.include?(converted_selected_move)
                  board.board1[converted_selected_piece[0]][converted_selected_piece[1]].make_move(board.board1, converted_selected_piece, converted_selected_move)
                  break
                else
                  puts "Invalid move! Try again."
                end
              end
            else
              puts "You cannot move that piece, that's cheating!!!"
            end
          end
        end
    end

    def quit_game?
        @game_over
    end

end




def create_board
    my_board = Board.new
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

    return my_board
end

def render_ascii_art
    File.foreach("asciiart.txt") do |line|
      puts line
    end
end
  
render_ascii_art()


def new_game()
  puts "Welcome to Terminal-Chess game!!"
  chess_board = create_board
  chess_board.display_board
  chess_board.load_game()
  # puts "This is chess board array : #{chess_board.board1}"
  puts "Enter your name,player 1..."
  name1 = gets.chomp
  puts "#{name1} will move the white pieces"
  puts "Enter your name,player 2..."
  name2 = gets.chomp
  puts "#{name2} will move the black pieces"



  player1 = Player.new(name1, :white, chess_board)
  player2 = Player.new(name2, :black, chess_board)


  while true
    player1.move(chess_board)
    chess_board.display_board
  #   p chess_board.find_kings(chess_board.board1)
    chess_board.in_check?(chess_board.board1)
    # puts chess_board.checkmate?(chess_board.board1)
    chess_board.checkmate?(chess_board.board1)

    if player1.quit_game? || player2.quit_game?
      break  # Exit the loop if either player wants to quit
    end

    player2.move(chess_board)
    chess_board.display_board
    chess_board.in_check?(chess_board.board1)
    chess_board.checkmate?(chess_board.board1)

    if player1.quit_game? || player2.quit_game?
      break  # Exit the loop if either player wants to quit
    end
  end
end

new_game()