require './lib/game'
require './lib/player'

describe Player do
  subject(:new_player) { described_class.new }

  describe '#check_position' do
    context 'when user inputs two incorrect values, then a valid input' do
      before do
        allow($board).to receive(:include?).and_return(false, false, true)
      end

      xit 'completes loop twice and returns error message twice' do
        error_message = "You have not indicated an available position. Please try again."
        expect(new_player).to receive(:puts).and_return(error_message).twice
        new_player.check_position(true)
      end

      xit 'should return the board with an X on place 8' do
        updated_board = "1 2 3\n4 5 6\n7 X 9"
        expect { new_player.check_position }.to output(updated_board).to_stdout
      end
    end
  end

end