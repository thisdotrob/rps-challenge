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

  context '#set_names' do
    it 'sets player one\'s name' do
      game.set_names(:Player_one, nil)
      expect(game.player1_name).to be (:Player_one)
    end

    it 'sets player two\'s name' do
      game.set_names(:Player_one, :Player_two)
      expect(game.player2_name).to be (:Player_two)
    end

    it 'sets player two\'s name to "Computer" by default' do
      game.set_names(:Player_one, nil)
      expect(game.player2_name).to eq ('Computer')
    end
  end


end
