# class White
#     class WhitePawn
#         attr_accessor :encoded_symbol,:move_count

#         def initialize
#             @encoded_symbol = "\u2659"
#             @encoded_symbol = @encoded_symbol.encode('utf-8')
#             @move_count = 0
#         end

#         def to_s
#             @encoded_symbol
#         end
        
        
#         def move_pawn(board, pos)
#             possible_moves = []
        
#             # Check for the initial double move
#             if @move_count == 0
#               # If the square one or two squares forward is emptpos[1], add it to possible_moves
#               if board[pos[0] - 1][pos[1]] == ' ' && board[pos[0] - 2][pos[1]] == ' '
#                 possible_moves.push([pos[0] - 2, pos[1]])
#                 possible_moves.push([pos[0] - 1,pos[1]])
#               end
#             end

#         # Check for capturing diagonallpos[1]
#             if board[pos[0] - 1][pos[1] + 1] != ' ' && board[pos[0] - 1][pos[1] + 1] != nil && board[pos[0] - 1][pos[1]+ 1].class != White::WhiteBishop && board[pos[0] - 1][pos[1]+ 1].class != White::WhiteRook && board[pos[0] - 1][pos[1]+ 1].class != White::WhiteKnight && board[pos[0] - 1][pos[1]+ 1].class != White::WhiteKing && board[pos[0] - 1][pos[1]+ 1].class != White::WhiteQueen &&  board[pos[0] - 1][pos[1]+ 1].class != White::WhitePawn 
#                 possible_moves.push([pos[0] - 1, pos[1] + 1])
#             end
        
#             if board[pos[0] - 1][pos[1] - 1] != ' ' && board[pos[0] - 1][pos[1] - 1].class != Integer && board[pos[0] - 1][pos[1] - 1].class != White::WhiteBishop && board[pos[0] - 1][pos[1] - 1].class != White::WhiteRook && board[pos[0] - 1][pos[1] - 1].class != White::WhiteKnight && board[pos[0] - 1][pos[1] - 1].class != White::WhiteKing && board[pos[0] - 1][pos[1] - 1].class != White::WhiteQueen && board[pos[0] - 1][pos[1] - 1].class != White::WhitePawn
#                 possible_moves.push([pos[0] - 1, pos[1] - 1])
#             end

#             #Regular one step,works with an emptpos[1] square or a square with an opponent piece
#             if board[pos[0] - 1,pos[1]] == " " && @move_count > 0
#                 possible_moves.push([pos[0] - 1, pos[1]])
#                 puts "HEELO"
#             end

#             return possible_moves
#             ##The Enpassent move and the move to promote the pawn still needs to be set up
#         end

#         def make_move(board, initial, ending)
#             board[ending[0]][ending[1]] = board[initial[0]][initial[1]]
#             board[initial[0]][initial[1]] = " "
#             @move_count += 1
#         end
#     end

#     class WhiteRook
#         attr_accessor :encoded_symbol

#         def initialize
#             @encoded_symbol = "\u2656"
#             @encoded_symbol = @encoded_symbol.encode('utf-8')
#         end

#         def to_s
#             @encoded_symbol
#         end

#         def move_rook(board,pos)
#             possible_moves = []


#             initial_val = 1
#             # Check vertical-up movement
#             while pos[0] - initial_val >= 0 && board[pos[0] - initial_val][pos[1]] == " "
#                 possible_moves.push([pos[0] - initial_val, pos[1]])
#                 initial_val += 1
#             end
            
#             initial_val = 1
#             #Check vertical-down movement
#             while pos[0] + initial_val < 8 && board[pos[0] + initial_val][pos[1]] == " "
#                 possible_moves.push([pos[0] + initial_val, pos[1]])
#                 initial_val += 1
#             end
            
            
#             initial_val = 1
#             #Check right side
#             while pos[1] < 8 && board[pos[0]][pos[1] + initial_val] == " "
#                 possible_moves.push([pos[0],pos[1] + initial_val])
#                 initial_val += 1
#             end

#             #Check left side
#             initial_val = 1
#             while pos[1] > 0 && board[pos[0]][pos[1] - initial_val] == " "
#                 possible_moves.push([pos[0],pos[1] - initial_val])
#                 initial_val += 1
#             end

#             return possible_moves
#         end

#         def make_move(board, initial, ending)
#             board[ending[0]][ending[1]] = board[initial[0]][initial[1]]
#             board[initial[0]][initial[1]] = " "
#         end
#     end

#     class WhiteBishop
#         attr_accessor :encoded_symbol

#         def initialize
#             @encoded_symbol = "\u2657"
#             @encoded_symbol = @encoded_symbol.encode('utf-8')
#         end

#         def to_s
#             @encoded_symbol
#         end

#         def move_bishop(board,pos)
#             possible_moves = []

#             initial_val = 1
#             #Up&Right
#             while pos[0] - initial_val >= 0 && pos[1] + initial_val <= 8 && board[pos[0] - initial_val][pos[1] + initial_val] == " "
#                 possible_moves.push([pos[0] - initial_val,pos[1] + initial_val])
#                 initial_val += 1
#             end

#             initial_val = 1
#             #Up&Left
#             while pos[0] - initial_val >= 0 && pos[1] - initial_val >= 0 && board[pos[0] - initial_val][pos[1] - initial_val] == " "
#                 possible_moves.push([pos[0] - initial_val,pos[1] - initial_val])
#                 initial_val += 1
#             end
            
#             initial_val = 1
#             #Down&Right
#             while pos[0] + initial_val <= 7 && pos[1] + initial_val <= 8 && board[pos[0] + initial_val][pos[1]+ initial_val] == " "
#                 possible_moves.push([pos[0] + initial_val,pos[1] + initial_val])
#                 initial_val += 1
#             end


#             initial_val = 1
#             #Down&Left
#             while pos[0] + initial_val <= 7 && pos[1] - initial_val >= 0 && board[pos[0] + initial_val][pos[1]- initial_val] == " "
#                 possible_moves.push([pos[0] + initial_val,pos[1] - initial_val])
#                 initial_val += 1
#             end

#             return possible_moves
#         end

#         def make_move(board, initial, ending)
#             board[ending[0]][ending[1]] = board[initial[0]][initial[1]]
#             board[initial[0]][initial[1]] = " "
#         end
#     end

#     class WhiteKnight
#         attr_accessor :encoded_symbol

#         def initialize
#             @encoded_symbol = "\u2658"
#             @encoded_symbol = @encoded_symbol.encode('utf-8')
#         end

#         def to_s
#             @encoded_symbol
#         end

#         def move_knight(board,pos)
#             neighbors = [
#                 [pos[0] + 2, pos[1] + 1], [pos[0] - 2, pos[1] + 1],
#                 [pos[0] + 2, pos[1] - 1], [pos[0] - 2, pos[1] - 1],
#                 [pos[0] + 1, pos[1] + 2], [pos[0] - 1, pos[1] + 2],
#                 [pos[0] + 1, pos[1] - 2], [pos[0] - 1, pos[1] - 2]
#             ]
            
#             possible_moves = neighbors.select { |n| n[0] >=0 && n[1] >= 1 && n[0] < 8 && n[1] <= 8 && board[n[0]][n[1]].class != White::WhiteBishop && board[n[0]][n[1]].class != White::WhitePawn && board[n[0]][n[1]].class != White::WhiteRook && board[n[0]][n[1]].class != White::WhiteQueen && board[n[0]][n[1]].class != White::WhiteKing }
#             return possible_moves
#         end


#         def make_move(board, initial, ending)
#             board[ending[0]][ending[1]] = board[initial[0]][initial[1]]
#             board[initial[0]][initial[1]] = " "
#         end

#     end

#     class WhiteQueen
#         attr_accessor :encoded_symbol

#         def initialize
#             @encoded_symbol = "\u2655"
#             @encoded_symbol = @encoded_symbol.encode('utf-8')
#         end

#         def to_s
#             @encoded_symbol
#         end

#         def move_queen(board,pos)
#             possible_moves = []


#             #Bishop's Moves
#             initial_val = 1
#             #Up&Right
#             while pos[0] - initial_val >= 0 && pos[1] + initial_val <= 8 && board[pos[0] - initial_val][pos[1] + initial_val] == " "
#                 possible_moves.push([pos[0] - initial_val,pos[1] + initial_val])
#                 initial_val += 1
#             end

#             initial_val = 1
#             #Up&Left
#             while pos[0] - initial_val >= 0 && pos[1] - initial_val >= 0 && board[pos[0] - initial_val][pos[1] - initial_val] == " "
#                 possible_moves.push([pos[0] - initial_val,pos[1] - initial_val])
#                 initial_val += 1
#             end
            
#             initial_val = 1
#             #Down&Right
#             while pos[0] + initial_val <= 7 && pos[1] + initial_val <= 8 && board[pos[0] + initial_val][pos[1]+ initial_val] == " "
#                 possible_moves.push([pos[0] + initial_val,pos[1] + initial_val])
#                 initial_val += 1
#             end


#             initial_val = 1
#             #Down&Left
#             while pos[0] + initial_val <= 7 && pos[1] - initial_val >= 0 && board[pos[0] + initial_val][pos[1]- initial_val] == " "
#                 possible_moves.push([pos[0] + initial_val,pos[1] - initial_val])
#                 initial_val += 1
#             end

#             #Rook's Moves
#             initial_val = 1
        
#             # Check vertical-up movement
#             while pos[0] - initial_val >= 0 && board[pos[0] - initial_val][pos[1]] == " "
#                 possible_moves.push([pos[0] - initial_val, pos[1]])
#                 initial_val += 1
#             end


#             initial_val = 1
#             #Check vertical-down movement
#             while pos[0] + initial_val < 8 && board[pos[0] + initial_val][pos[1]] == " "
#                 possible_moves.push([pos[0] + initial_val, pos[1]])
#                 initial_val += 1
#             end

#             initial_val = 1
#             #Check right side
#             while pos[1] < 8 && board[pos[0]][pos[1] + initial_val] == " "
#                 possible_moves.push([pos[0],pos[1] + initial_val])
#                 initial_val += 1
#             end

#             #Check left side
#             initial_val = 1
#             while pos[1] > 0 && board[pos[0]][pos[1] - initial_val] == " "
#                 possible_moves.push([pos[0],pos[1] - initial_val])
#                 initial_val += 1
#             end

#             return possible_moves
#         end

#         def make_move(board, initial, ending)
#             board[ending[0]][ending[1]] = board[initial[0]][initial[1]]
#             board[initial[0]][initial[1]] = " "
#         end
#     end

#     class WhiteKing
#         attr_accessor :encoded_symbol

#         def initialize
#             @encoded_symbol = "\u2654"
#             @encoded_symbol = @encoded_symbol.encode('utf-8')
#         end

#         def to_s
#             @encoded_symbol
#         end

#         def move_king(board,pos)
#             possible_moves = []
#             neighbors = [
#                 [pos[0] + 1, pos[1]], [pos[0] - 1, pos[1]],
#                 [pos[0] + 1, pos[1] + 1], [pos[0] - 1, pos[1] - 1],
#                 [pos[0] - 1, pos[1] + 1], [pos[0], pos[1] - 1],
#                 [pos[0], pos[1]+1], [pos[0] + 1, pos[1] - 1]
#             ]

#             possible_moves = neighbors.select { |n| n[0] >=0 && n[1] >= 1 && n[0] < 8 && n[1] <= 8 && board[n[0]][n[1]].class != White::WhiteBishop && board[n[0]][n[1]].class != White::WhitePawn && board[n[0]][n[1]].class != White::WhiteRook && board[n[0]][n[1]].class != White::WhiteQueen && board[n[0]][n[1]].class != White::WhiteKnight }
#             return possible_moves
#         end

#         def make_move(board, initial, ending)
#             board[ending[0]][ending[1]] = board[initial[0]][initial[1]]
#             board[initial[0]][initial[1]] = " "
#         end
#     end
# end

# #Need to add 2 Bishops,2 Knights, 2 Rooks,1 King,1 Queen


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
            if pos[1] >= 2 && board[pos[0] - 1][pos[1] - 1] != ' ' && board[pos[0] - 1][pos[1]].class != Integer
                possible_moves.push([pos[0] - 1, pos[1] - 1])
            end
    
            # Regular one step, works with an empty square or a square with an opponent piece
            if board[pos[0] - 1][pos[1]] == " "
                possible_moves.push([pos[0] - 1, pos[1]])
            end
        else
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
