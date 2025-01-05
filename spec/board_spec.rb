require_relative '../lib/board.rb'
require_relative '../lib/pieces.rb'

require 'rspec'

RSpec.describe Board do
    let(:board) { Board.new }
  
    describe '#convert_to_alphanumeric' do
      it 'converts coordinates to alphanumeric format' do
        expect(board.convert_to_alphanumeric([0, 1])).to eq('A8')
        expect(board.convert_to_alphanumeric([7, 7])).to eq('G1')
      end
    end

    describe '#convert_from_alphanumeric' do
        it 'converts an alphanumeric output to a board coordinate' do
            expect(board.convert_from_alphanumeric('A8')).to eq([0,1])
            expect(board.convert_from_alphanumeric('G1')).to eq([7,7])
        end
    end

    describe '#find_kings' do
        it 'iterates through all the elements on the chess board and returns an array with coordinates of the King pieces' do 
            # Stub the King class
            king_double = instance_double(King)
            allow(king_double).to receive(:is_a?).with(King).and_return(true)

            # Create a board with a mocked King at position [0, 5] and [7, 5]
            board_with_kings = Array.new(8) { Array.new(8, nil) }
            board_with_kings[0][5] = king_double
            board_with_kings[7][5] = king_double

            # Set up the Board instance with the mocked board
            allow(board).to receive(:board1).and_return(board_with_kings)

            # Run the test
            expect(board.find_kings(board.board1)).to eq([[0, 5], [7, 5]])
        end
    end

    describe '#in_check?' do
    let(:board) { described_class.new }  # Assuming your Board class is described_class
    let(:white_king) { instance_double(King, color: :white) }
    let(:black_king) { instance_double(King, color: :black) }

    before do
        board.board1
    end
  
    it 'checks that kings are instances of the King class' do
      board.board1[0][4] = white_king  
      board.board1[7][4] = black_king 

      # Call the in_check? method
      p board.board1
      result = board.in_check?(board.board1)
  
      # Expectations
      expect(result).to eq(2)  # Assuming no check condition for this test
    end
  end
end
)