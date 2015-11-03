require 'game'

describe Game do
  subject(:game){ Game.new }

  context '#set_mode' do
    it 'sets mode to :single_player' do
      game.set_mode(:single_player)
      expect(game.mode).to eq (:single_player)
    end
    it 'sets mode to :two_player' do
      game.set_mode(:two_player)
      expect(game.mode).to eq (:two_player)
    end
    it 'raises error if argument is not :single_player or :two_player' do
      expect{ game.set_mode(:argument) }.to raise_error Game::SET_MODE_ERROR
    end
  end
end
