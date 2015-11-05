require 'game'

describe Game do
  subject(:game){ Game.new(player1, player2) }

  let(:player1){ double(:player1, set_name: nil) }
  let(:player2){ double(:player2, set_name: nil) }

  context '#initialize' do
    it 'initializes two players' do
      expect(game.players).to eq [player1, player2]
    end
  end

  context '#set_mode' do
    it 'sets mode to :single_player' do
      game.set_mode(:single_player)
      expect(game.mode).to be(:single_player)
    end
    it 'sets mode to :two_player' do
      game.set_mode(:two_player)
      expect(game.mode).to be(:two_player)
    end
    it 'raises error if argument is not :single_player or :two_player' do
      expect{ game.set_mode(:argument) }.to raise_error Game::SET_MODE_ERROR
    end
  end

  context '#set_names' do
    it 'sets player 1\'s name' do
      expect(player1).to receive(:set_name)
      game.set_names(:name, nil)
    end
    it 'sets player 2\'s name' do
      expect(player2).to receive(:set_name)
      game.set_names(nil, :name)
    end
    it 'sets player two\'s name to "Computer" by default' do
      expect(player2).to receive(:set_name).with('Computer')
      game.set_names(:name, nil)
    end
  end

  context '#player1_name' do
    it 'gets the first player\'s name' do
      expect(player1).to receive(:name)
      game.player1_name
    end
  end

  context '#player2_name' do
    it 'gets the second player\'s name' do
      expect(player2).to receive(:name)
      game.player2_name
    end
  end

  context '#set_choice' do
    it 'sets player 1\'s choice' do
      allow(player1).to receive(:chosen?) {false}
      expect(player1).to receive(:set_choice).with(:rock)
      game.set_player_choice(:rock)
    end
    it 'sets player 2\'s choice' do
      allow(player1).to receive(:chosen?) {true}
      expect(player2).to receive(:set_choice).with(:paper)
      game.set_player_choice(:paper)
    end
    it 'raises error if choice is invalid' do
      expect{ game.set_player_choice(:fish) }.to raise_error Game::SET_CHOICE_ERROR
    end
  end

  context '#set_computer_choice' do
    it 'sets player 2\'s choice' do
      allow(Game::CHOICES).to receive(:sample) { :paper }
      expect(player2).to receive(:set_choice).with(:paper)
      game.set_computer_choice
    end
  end

  context '#over?' do
    it 'returns true if both player 1 and player 2\'s choices are set' do
      allow(player1).to receive(:chosen?) {true}
      allow(player2).to receive(:chosen?) {true}
      expect(game).to be_over
    end
    it 'returns false if either player\'s choice is unset' do
      allow(player1).to receive(:chosen?) {true}
      allow(player2).to receive(:chosen?) {false}
      expect(game).to_not be_over
    end
  end

end
