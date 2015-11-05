require 'game'

describe Game do
  subject(:game){ Game.new(:mode, players) }

  let(:player1){ double(:player1, set_name: nil) }
  let(:player2){ double(:player2, set_name: nil) }
  let(:players){ [player1, player2] }

  context '#initialize' do
    it 'initializes two players' do
      expect(game.players).to eq (players)
    end
    it 'defaults to two player mode' do
      expect(game).to_not be_single_player
    end
    it 'can set single player mode' do
      expect(Game.new(:single_player,players)).to be_single_player
    end
  end

  context '#set_names' do
    it 'sets player two\'s name to "Computer" by default' do
      expect(player2).to receive(:set_name).with('Computer')
      game.set_names(:name, nil)
    end
    it 'sets player 1\'s name' do
      expect(player1).to receive(:set_name)
      game.set_names(:name, nil)
    end
    it 'sets player 2\'s name' do
      expect(player2).to receive(:set_name)
      game.set_names(nil, :name)
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
