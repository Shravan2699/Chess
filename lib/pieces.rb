class White
    class WhitePawn
        attr_accessor :encoded_symbol,:move_count

        def initialize
            @symbol = "\u2659"
            @encoded_symbol = @symbol.encode('utf-8')
            @move_count = 0
        end

        def to_s
            @encoded_symbol
        end
        
        
        def move_pawn(board, pos)
            possible_moves = []
        
            # Check for the initial double move
            if @move_count == 0
              # If the square one or two squares forward is empty, add it to possible_moves
              if board[pos[0] - 1][pos[1]] == ' ' && board[pos[0] - 2][pos[1]] == ' '
                possible_moves.push([pos[0] - 2, pos[1]])
                possible_moves.push([pos[0] - 1,pos[1]])
              end
            end

        # Check for capturing diagonally
            if board[pos[0] - 1][pos[1] + 1] != ' ' && board[pos[0] - 1][pos[1] + 1] != nil && board[pos[0] - 1][pos[1]+ 1].class != White::WhiteBishop && board[pos[0] - 1][pos[1]+ 1].class != White::WhiteRook
                possible_moves.push([pos[0] - 1, pos[1] + 1])
            end
        
            if board[pos[0] - 1][pos[1] - 1] != ' ' && board[pos[0] - 1][pos[1] - 1].class != Integer && board[pos[0] - 1][pos[1] - 1].class != White::WhiteBishop && board[pos[0] - 1][pos[1] - 1].class != White::WhiteRook
                possible_moves.push([pos[0] - 1, pos[1] - 1])
            end

            #Regular one step,works with an empty square or a square with an opponent piece
            if board[pos[0] - 1,pos[1]] == " "
                possible_moves.push([pos[0] - 1, pos[1]])
                puts "HEELO"
            end

            return possible_moves
            ##The Enpassent move and the move to promote the pawn still needs to be set up
        end

        def make_move(board, initial, ending)
            board[ending[0]][ending[1]] = board[initial[0]][initial[1]]
            board[initial[0]][initial[1]] = " "
            @move_count += 1
        end
    end

    class WhiteRook
        attr_accessor :encoded_symbol

        def initialize
            @symbol = "\u2656"
            @encoded_symbol = @symbol.encode('utf-8')
        end

        def to_s
            @encoded_symbol
        end

        def move_rook(board,pos)
            possible_moves = []
            initial_val = 1
        
            # Check vertical movement
            while pos[0] - initial_val >= 0 && board[pos[0] - initial_val][pos[1]] == " "
                possible_moves.push([pos[0] - initial_val, pos[1]])
                initial_val += 1
            end
            
            initial_val = 1
            #Check right side
            while pos[1] < 8 && board[pos[0]][pos[1] + initial_val] == " "
                possible_moves.push([pos[0],pos[1] + initial_val])
                initial_val += 1
            end


            initial_val = 1
            while pos[1] > 0 && board[pos[0]][pos[1] - initial_val] == " "
                possible_moves.push([pos[0],pos[1] - initial_val])
                initial_val += 1
            end

            return possible_moves
        end

        def make_move(board, initial, ending)
            board[ending[0]][ending[1]] = board[initial[0]][initial[1]]
            board[initial[0]][initial[1]] = " "
        end
    end

    class WhiteBishop
        attr_accessor :encoded_symbol

        def initialize
            @symbol = "\u2657"
            @encoded_symbol = @symbol.encode('utf-8')
        end

        def to_s
            @encoded_symbol
        end

        def move_bishop(board,pos)
            possible_moves = []

            initial_val = 1
            #Up&Right
            while pos[0] - initial_val >= 0 && pos[1] + initial_val <= 8 && board[pos[0] - initial_val][pos[1] + initial_val] == " "
                possible_moves.push([pos[0] - initial_val,pos[1] + initial_val])
                initial_val += 1
            end

            initial_val = 1
            #Up&Left
            while pos[0] - initial_val >= 0 && pos[1] - initial_val >= 0 && board[pos[0] - initial_val][pos[1] - initial_val] == " "
                possible_moves.push([pos[0] - initial_val,pos[1] - initial_val])
                initial_val += 1
            end
            
            initial_val = 1
            #Down&Right
            while pos[0] + initial_val <= 7 && pos[1] + initial_val <= 8 && board[pos[0] + initial_val][pos[1]+ initial_val] == " "
                possible_moves.push([pos[0] + initial_val,pos[1] + initial_val])
                initial_val += 1
            end


            initial_val = 1
            #Down&Left
            while pos[0] + initial_val <= 7 && pos[1] - initial_val >= 0 && board[pos[0] + initial_val][pos[1]- initial_val] == " "
                possible_moves.push([pos[0] + initial_val,pos[1] - initial_val])
                initial_val += 1
            end

            return possible_moves
        end

        def make_move(board, initial, ending)
            board[ending[0]][ending[1]] = board[initial[0]][initial[1]]
            board[initial[0]][initial[1]] = " "
        end
    end

    class WhiteKnight
        attr_accessor :encoded_symbol

        def initialize
            @symbol = "\u2658"
            @encoded_symbol = @symbol.encode('utf-8')
        end

        def to_s
            @encoded_symbol
        end

        def move_knight(board,pos)
            possible_moves = []

end

#Need to add 2 Bishops,2 Knights, 2 Rooks,1 King,1 Queen