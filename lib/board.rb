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
        cell
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

#Need to find the position of the king wrt the chessboard not an array.
#Need to check all moves of all the pieces and see if it includes the opposition king,if it does == check


  def find_kings(board_arr)
    # p board_arr
    king_coordinates = []

    board_arr.each_with_index do |row, row_index|
      row.each_with_index do |piece, col_index|
        if piece.is_a?(King)
          king_coordinates << [row_index, col_index]  # Store coordinates of the King
        end
      end
    end
    converted_king_coordinates = []
    if king_coordinates.empty?
      return nil
    else
      king_coordinates.each do |king|
        converted_king_coordinates.push(self.convert_to_alphanumeric(king))
      end
      return king_coordinates
    end
  end


  #This function will get the job done,we just need to implement this correctly
  def in_check?(board)
    all_kings = self.find_kings(board)
    # return 3 if all_kings.nil?
    p board

    opposition_king_coordinate = 0
    white_king_pos = 0
    black_king_pos = 0


    all_kings.each do |king|
      if board[king[0]][king[1]].color == :black
        black_king_pos = king
      elsif board[king[0]][king[1]].color == :white
        white_king_pos = king
      end
    end

    

    white_player_moves = []
    black_player_moves = []
    board.each_with_index do |row, row_index|
      row.each_with_index do |piece, col_index|
        if piece.is_a?(Integer) || piece.nil? || piece == " "
          next
        elsif piece.respond_to?(:color) && piece.color == :white
          case piece
          when Pawn
            white_player_moves.concat(piece.move_pawn(self.board1, [row_index, col_index]))
          when Rook
            white_player_moves.concat(piece.move_rook(self.board1, [row_index, col_index]))
          when Knight
            white_player_moves.concat(piece.move_knight(self.board1, [row_index, col_index]))
          when Queen
            white_player_moves.concat(piece.move_queen(self.board1, [row_index, col_index]))
          when Bishop
            white_player_moves.concat(piece.move_bishop(self.board1, [row_index, col_index]))
          end
        elsif piece.respond_to?(:color) && piece.color == :black
          case piece
          when Pawn
            black_player_moves.concat(piece.move_pawn(self.board1, [row_index, col_index]))
          when Rook
            black_player_moves.concat(piece.move_rook(self.board1, [row_index, col_index]))
          when Knight
            black_player_moves.concat(piece.move_knight(self.board1, [row_index, col_index]))
          when Queen
            black_player_moves.concat(piece.move_queen(self.board1, [row_index, col_index]))
          when Bishop
            black_player_moves.concat(piece.move_bishop(self.board1, [row_index, col_index]))
          end
        end
      end
    end


    if  white_player_moves.include?(black_king_pos)
      puts "Its a check!!\nBlack is in check"
      return 0
    elsif black_player_moves.include?(white_king_pos)
      puts "Its a check!!\nWhite is in check"
      return 1
    else 
      # puts "No check!!"
      return 2
    end
  end


  def checkmate?(board)
    all_kings = self.find_kings(board)
    white_king_pos = 0
    black_king_pos = 0
    all_kings.each do |king|
      if board[king[0]][king[1]].color == :black
        black_king_pos = king
      elsif board[king[0]][king[1]].color == :white
        white_king_pos = king
      end
    end


    black_king = board[black_king_pos[0]][black_king_pos[1]]
    white_king = board[white_king_pos[0]][white_king_pos[1]]
    #To check if white King is checkmate or not
    if self.in_check?(board) == 1
      if white_king.move_king(self.board1,white_king_pos).empty?
        puts "It's a checkmate!!\nBlack has won the game"
      elsif black_king.move_king(self.board1,black_king_pos).empty?
        puts "It's a checkmate!!\nWhite has won the game"
      end
    end
  end


  def load_game(board)


  end

#   def save_game(rand_word,user_guessed_word,incorrect,rem_guesses)
#     puts "Please enter the name of the game save"
#     game_save_name = gets.chomp
#     save_obj = {}
#     save_obj[:random_word] = rand_word
#     save_obj[:user_guess_progress] = user_guessed_word
#     save_obj[:guesses] = rem_guesses
#     save_obj[:incorrect_arr] = incorrect
#     File.open("./savefiles/#{game_save_name}.yml", "w") { |file| file.write(save_obj.to_yaml) }
#     puts "Your progess has been saved..."
# end

  def save_game?(current_board_arr)
    puts "Please enter the name of the game save"
    game_save_name = gets.chomp
    save_obj = {}
    save_obj[:current_board_arr] = current_board_arr
    File.open("./savefiles/#{game_save_name}.yml", "w") { |file| file.write(save_obj.to_yaml) }
    puts "Your progress has been saved..."
  end

  def load_game()
    load_idx = 1
    save_games_array = Dir.children("./savefiles/")
    puts "Select the number for the save file you want to load"
    save_games_array.each_with_index do |elem,idx|
        puts "#{idx+1}. #{elem.chomp(".rb")}"
    end
    load_idx = gets.chomp.to_i - 1
    if load_idx >= 0 && load_idx < save_games_array.length
      obj_from_yaml_file = YAML.load(File.read("./savefiles/#{save_games_array[load_idx]}"))
      loaded_board_array = obj_from_yaml_file[:current_board_arr]
      p loaded_board_array
      if load_idx <= save_games_array.length && load_idx >= 0
        incorrect_load_ans = false
      end
    else
      puts "\n\n\n\nInvalid Input"
      puts "Let's start a new game instead!"
      new_game()
    end
  end
end

