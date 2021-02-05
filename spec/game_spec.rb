require './lib/game'
require './lib/player'

describe Game do
  subject(:new_game) { described_class.new(player1, player2) }
  let(:player1) { instance_double(Player) }
  let(:player2) { instance_double(Player) }

  describe '#take_turns' do
    it 'shows that Player 1 has won' do
      allow(player1).to receive(:place_symbol)
      allow(player1).to receive(:has_won?).and_return(true)
      output = "Player 1, you have won!"
      expect(new_game).to receive(:puts).with(output)
      new_game.take_turns
    end

    it 'shows that players have tied' do
      allow(player1).to receive(:place_symbol)
      allow(player1).to receive(:has_won?).and_return(false)
      allow(player1).to receive(:has_tied?).and_return(true)
      output = "You have tied!"
      expect(new_game).to receive(:puts).with(output)
      new_game.take_turns
    end

    it 'shows that Player 2 has won' do
      allow(player1).to receive(:place_symbol)
      allow(player1).to receive(:has_won?).and_return(false)
      allow(player1).to receive(:has_tied?).and_return(false)
      allow(player2).to receive(:place_symbol)
      allow(player2).to receive(:has_won?).and_return(true)
      output = "Player 2, you have won!"
      expect(new_game).to receive(:puts).with(output)
      new_game.take_turns
    end

  end


end