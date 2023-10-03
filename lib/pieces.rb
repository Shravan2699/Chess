class Piece
    attr_accessor :encoded_symbol, :color

    def initialize(encoded_symbol, color)
      @encoded_symbol = encoded_symbol.encode('utf-8')
      @color = color
    end
  
    def to_s
      @encoded_symbol
    end

    def make_move(board, initial, ending)
        board[ending[0]][ending[1]] = board[initial[0]][initial[1]]
        board[initial[0]][initial[1]] = " "
    end
end

class Pawn < Piece

    def initialize(color)
        encoded_symbol = color == :white ? "\u2659" : "\u265F"
        super(encoded_symbol, color)
    end

    
    def move_pawn(board, pos)
        possible_moves = []
    
        if color == :white
            #Promoting pawns if they make it to the backside of the black pieces

            # Checking if initial double step is possible or not
            if pos[0] == 6
                if board[pos[0] - 1][pos[1]] == " " && board[pos[0] - 2][pos[1]] == " "
                    possible_moves.push([pos[0] - 2, pos[1]])
                    possible_moves.push([pos[0] - 1, pos[1]])
                end
            end
    
            # Checking diagonally - right side
            if pos[1] < 7 && board[pos[0] - 1][pos[1] + 1] != ' ' && board[pos[0] - 1][pos[1] + 1].color != :white
                possible_moves.push([pos[0] - 1, pos[1] + 1])
            end
    
            # Checking diagonally - left side
            if pos[1] >= 2 && board[pos[0] - 1][pos[1] - 1] != ' ' && board[pos[0] - 1][pos[1]].class != Integer && board[pos[0] - 1][pos[1] - 1].color != :white
                possible_moves.push([pos[0] - 1, pos[1] - 1])
            end
    
            # Regular one step, works with an empty square or a square with an opponent piece
            if board[pos[0] - 1][pos[1]] == " "
                possible_moves.push([pos[0] - 1, pos[1]])
            end
        else
            #Promoting pawns if they make it to the backside of the black pieces

            
            # Checking if the initial double step is possible or not
            if pos[0] == 1
                if board[pos[0] + 1][pos[1]] == " " && board[pos[0] + 2][pos[1]] == " "
                    possible_moves.push([pos[0] + 2, pos[1]])
                    possible_moves.push([pos[0] + 1, pos[1]])
                end
            end
    
            # Checking diagonally - right side
            if pos[1] < 7 && board[pos[0] + 1][pos[1] + 1] != ' ' && board[pos[0] + 1][pos[1] + 1].color != :black
                possible_moves.push([pos[0] + 1, pos[1] + 1])
            end
    
            # Checking diagonally - left side
            if pos[1] >= 2 && board[pos[0] + 1][pos[1] - 1] != ' ' && board[pos[0] + 1][pos[1] - 1].color != :black
                possible_moves.push([pos[0] + 1, pos[1] - 1])
            end
    
            # Regular one step, works with an empty square or a square with an opponent piece
            if board[pos[0] + 1][pos[1]] == " "
                possible_moves.push([pos[0] + 1, pos[1]])
            end
        end
        return possible_moves.uniq
    end
end
  

class Rook < Piece
    def initialize(color)
        encoded_symbol = color == :white ? "\u2656" : "\u265C"
        super(encoded_symbol, color)
    end

    def move_rook(board,pos)
        possible_moves = []

        if color == :white
            initial_val = 1
            # Check vertical-up movement
            while pos[0] - initial_val >= 0
                target_piece = board[pos[0] - initial_val][pos[1]]
        
                if target_piece == " "
                    possible_moves.push([pos[0] - initial_val, pos[1]])
                elsif target_piece.color == :black
                    possible_moves.push([pos[0] - initial_val, pos[1]])
                    break  # Include the black piece and stop adding positions
                else
                    break  # Stop adding positions if there's a white piece
                end
        
                initial_val += 1
            end

            #Check vertical-down movement
            initial_val = 1
            while pos[0] + initial_val < 8
                target_piece = board[pos[0] + initial_val][pos[1]]
        
                if target_piece == " "
                    possible_moves.push([pos[0] + initial_val, pos[1]])
                elsif target_piece.color == :black
                    possible_moves.push([pos[0] + initial_val, pos[1]])
                    break  # Include the black piece and stop adding positions
                else
                    break  # Stop adding positions if there's a white piece
                end
        
                initial_val += 1
            end


           #Check right movement
           initial_val = 1
           while pos[1] + initial_val <= 8
               target_piece = board[pos[0]][pos[1] + initial_val]
       
               if target_piece == " "
                   possible_moves.push([pos[0], pos[1] + initial_val])
               elsif target_piece.color == :black
                   possible_moves.push([pos[0], pos[1] + initial_val])
                   break  # Include the black piece and stop adding positions
               else
                   break  # Stop adding positions if there's a white piece
               end
       
               initial_val += 1
           end

            #Check left movement
            initial_val = 1
            while pos[1] - initial_val > 0
                target_piece = board[pos[0]][pos[1] - initial_val]
        
                if target_piece == " "
                    possible_moves.push([pos[0], pos[1] - initial_val])
                elsif target_piece.color == :black
                    possible_moves.push([pos[0], pos[1] - initial_val])
                    break  # Include the black piece and stop adding positions
                else
                    break  # Stop adding positions if there's a white piece
                end
        
                initial_val += 1
            end
        else
            initial_val = 1
            # Check vertical-up movement
            while pos[0] - initial_val >= 0
                target_piece = board[pos[0] - initial_val][pos[1]]
        
                if target_piece == " "
                    possible_moves.push([pos[0] - initial_val, pos[1]])
                elsif target_piece.color == :white
                    possible_moves.push([pos[0] - initial_val, pos[1]])
                    break  # Include the black piece and stop adding positions
                else
                    break  # Stop adding positions if there's a white piece
                end
        
                initial_val += 1
            end


            #Check vertical-down movement
            initial_val = 1
            while pos[0] + initial_val < 8
                target_piece = board[pos[0] + initial_val][pos[1]]
        
                if target_piece == " "
                    possible_moves.push([pos[0] + initial_val, pos[1]])
                elsif target_piece.color == :white
                    possible_moves.push([pos[0] + initial_val, pos[1]])
                    break  # Include the black piece and stop adding positions
                else
                    break  # Stop adding positions if there's a white piece
                end
        
                initial_val += 1
            end

            #Check Right side movement
            initial_val = 1
            while pos[1] - initial_val > 0
                target_piece = board[pos[0]][pos[1] - initial_val]
        
                if target_piece == " "
                    possible_moves.push([pos[0], pos[1] - initial_val])
                elsif target_piece.color == :white
                    possible_moves.push([pos[0], pos[1] - initial_val])
                    break  # Include the black piece and stop adding positions
                else
                    break  # Stop adding positions if there's a white piece
                end
        
                initial_val += 1
            end

            #Check Left side movement
            initial_val = 1
            while pos[1] + initial_val <= 8
                target_piece = board[pos[0]][pos[1] + initial_val]
        
                if target_piece == " "
                    possible_moves.push([pos[0], pos[1] + initial_val])
                elsif target_piece.color == :white
                    possible_moves.push([pos[0], pos[1] + initial_val])
                    break  # Include the black piece and stop adding positions
                else
                    break  # Stop adding positions if there's a white piece
                end
        
                initial_val += 1
            end
        end

        return possible_moves.uniq
    end
end


class Bishop < Piece
    def initialize(color)
        encoded_symbol = color == :white ? "\u2657" : "\u265D"
        super(encoded_symbol, color)
    end

    def move_bishop(board,pos)
        possible_moves = []

        if color == :white
            initial_val = 1

            #Up&Right
            while 0 < pos[0] - initial_val && pos[1] + initial_val < 8  
                target_piece = board[pos[0] - initial_val][pos[1] + initial_val]


                if target_piece == " "
                    possible_moves.push([pos[0] - initial_val,pos[1] + initial_val])    
                elsif target_piece.color == :black
                    possible_moves.push([pos[0] - initial_val,pos[1] + initial_val]) 
                    break
                else
                    break
                end

                initial_val += 1
            end

            #Up&Left
            initial_val = 1
            while pos[0] - initial_val >= 0 && pos[1] - initial_val > 0
                target_piece = board[pos[0] - initial_val][pos[1] - initial_val]


                if target_piece == " "
                    possible_moves.push([pos[0] - initial_val,pos[1] - initial_val])    
                elsif target_piece.color == :black
                    possible_moves.push([pos[0] - initial_val,pos[1] - initial_val]) 
                    break
                else
                    break
                end

                initial_val += 1
            end


            #Down&Right
            initial_val = 1
            while pos[0] + initial_val < 8 && pos[1] + initial_val <= 8 
                target_piece = board[pos[0] + initial_val][pos[1] + initial_val]


                if target_piece == " "
                    possible_moves.push([pos[0] + initial_val,pos[1] + initial_val])    
                elsif target_piece.color == :black
                    possible_moves.push([pos[0] + initial_val,pos[1] + initial_val]) 
                    break
                else
                    break
                end

                initial_val += 1
            end

            #Down&Left
            initial_val = 1
            while pos[0] + initial_val < 8 && pos[1] - initial_val > 0
                target_piece = board[pos[0] + initial_val][pos[1] - initial_val]


                if target_piece == " "
                    possible_moves.push([pos[0] + initial_val,pos[1] - initial_val])    
                elsif target_piece.color == :black
                    possible_moves.push([pos[0] + initial_val,pos[1] - initial_val]) 
                    break
                else
                    break
                end

                initial_val += 1
            end
        else            
            initial_val = 1
            #Up&Right
            while 0 < pos[0] - initial_val && pos[1] + initial_val < 8  
                target_piece = board[pos[0] - initial_val][pos[1] + initial_val]


                if target_piece == " "
                    possible_moves.push([pos[0] - initial_val,pos[1] + initial_val])    
                elsif target_piece.color == :white
                    possible_moves.push([pos[0] - initial_val,pos[1] + initial_val]) 
                    break
                else
                    break
                end

                initial_val += 1
            end

            #Up&Left
            initial_val = 1
            while pos[0] - initial_val >= 0 && pos[1] - initial_val > 0
                target_piece = board[pos[0] - initial_val][pos[1] - initial_val]

                if target_piece == " "
                    possible_moves.push([pos[0] - initial_val,pos[1] - initial_val])    
                elsif target_piece.color == :white
                    possible_moves.push([pos[0] - initial_val,pos[1] - initial_val]) 
                    break
                else
                    break
                end

                initial_val += 1
            end


            #Down&Right
            initial_val = 1
            while pos[0] + initial_val < 8 && pos[1] + initial_val <= 8
                target_piece = board[pos[0] + initial_val][pos[1] + initial_val]

                if target_piece == " "
                    possible_moves.push([pos[0] + initial_val,pos[1] + initial_val])    
                elsif target_piece.color == :white
                    possible_moves.push([pos[0] + initial_val,pos[1] + initial_val]) 
                    break
                else
                    break
                end

                initial_val += 1
            end

            #Down&Left
            initial_val = 1
            while pos[0] + initial_val < 8 && pos[1] - initial_val > 0
                target_piece = board[pos[0] + initial_val][pos[1] - initial_val]


                if target_piece == " "
                    possible_moves.push([pos[0] + initial_val,pos[1] - initial_val])    
                elsif target_piece.color == :white
                    possible_moves.push([pos[0] + initial_val,pos[1] - initial_val]) 
                    break
                else
                    break
                end

                initial_val += 1
            end
        end
        return possible_moves
    end
end


class Knight < Piece
    def initialize(color)
        encoded_symbol = color == :white ? "\u2658" : "\u265E"
        super(encoded_symbol, color)
    end

    def move_knight(board,pos)
        possible_moves = []
            neighbors = [
                [pos[0] + 2, pos[1] + 1], [pos[0] - 2, pos[1] + 1],
                [pos[0] + 2, pos[1] - 1], [pos[0] - 2, pos[1] - 1],
                [pos[0] + 1, pos[1] + 2], [pos[0] - 1, pos[1] + 2],
                [pos[0] + 1, pos[1] - 2], [pos[0] - 1, pos[1] - 2]
            ]

        if color == :white
            # possible_moves = neighbors.select { |n| n[0] >=0 && n[1] >= 1 && n[0] < 8 && n[1] <= 8 && board[n[0]][n[1]].color != :white }
            possible_moves = neighbors.select do |n|
                n[0] >= 0 && n[1] >= 1 && n[0] < 8 && n[1] <= 8 &&
                  board[n[0]][n[1]] == " " || ((board[n[0]][n[1]].is_a?(Piece) && board[n[0]][n[1]].color != :white))
              end
        else
            # possible_moves = neighbors.select { |n| n[0] >=0 && n[1] >= 1 && n[0] < 8 && n[1] <= 8 && board[n[0]][n[1]].color != :black }
            possible_moves = neighbors.select do |n|
                n[0] >= 0 && n[1] >= 1 && n[0] < 8 && n[1] <= 8 &&
                  board[n[0]][n[1]] == " " || ((board[n[0]][n[1]].is_a?(Piece) && board[n[0]][n[1]].color != :black))
              end
        end

        return possible_moves
    end
end


class Queen < Piece 
    #Rook + Bishop
    def initialize(color)
        encoded_symbol = color == :white ? "\u2655" : "\u265B"
        super(encoded_symbol, color)
    end

    def move_queen(board, pos)
        possible_moves = []
        if color == :white
            rook = Rook.new(:white)  # Create an instance of the Rook class
            bishop = Bishop.new(:white)  # Create an instance of the Bishop class
            possible_moves += rook.move_rook(board, pos)
            possible_moves += bishop.move_bishop(board, pos)
        else
            rook = Rook.new(:black)  # Create an instance of the Rook class
            bishop = Bishop.new(:black)  # Create an instance of the Bishop class
            possible_moves += rook.move_rook(board, pos)
            possible_moves += bishop.move_bishop(board, pos)
        end
        return possible_moves
    end
end


class King < Piece

    def initialize(color)
        encoded_symbol = color == :white ? "\u2654" : "\u265A"
        super(encoded_symbol, color)
    end

    def move_king(board, pos)
        possible_moves = []
        neighbors = [
            [pos[0] + 1, pos[1]], [pos[0] - 1, pos[1]],
            [pos[0] + 1, pos[1] + 1], [pos[0] - 1, pos[1] - 1],
            [pos[0] - 1, pos[1] + 1], [pos[0], pos[1] - 1],
            [pos[0], pos[1]+1], [pos[0] + 1, pos[1] - 1]
        ]
        if color == :white
            possible_moves = neighbors.select { |n| n[0] >=0 && n[1] >= 1 && n[0] < 8 && n[1] <= 8 && board[n[0]][n[1]] == " " || ((board[n[0]][n[1]].is_a?(Piece) && board[n[0]][n[1]].color != :white))}
        else
            possible_moves = neighbors.select { |n| n[0] >=0 && n[1] >= 1 && n[0] < 8 && n[1] <= 8 && board[n[0]][n[1]] == " " || ((board[n[0]][n[1]].is_a?(Piece) && board[n[0]][n[1]].color != :black)) }
        end
        return possible_moves
    end
end



