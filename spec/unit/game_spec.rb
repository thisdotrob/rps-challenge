require 'game'

describe Game do
  subject(:game){ Game.new }

  context '#set_mode' do
    it 'sets mode to :single_player' do
      game.set_mode(:single_player)
      expect(game.mode).to eq(:single_player)
    end

    it 'sets mode to :two_player' do
      game.set_mode(:two_player)
      expect(game.mode).to eq(:two_player)
    end

    it 'raises error if argument is not :single_player or :two_player' do
      expect{ game.set_mode(:argument) }.to raise_error Game::SET_MODE_ERROR
    end
  end

  context '#set_names' do
    it 'sets player one\'s name' do
      game.set_names(:Player_one, nil)
      expect(game.player1_name).to be(:Player_one)
    end

    it 'sets player two\'s name' do
      game.set_names(:Player_one, :Player_two)
      expect(game.player2_name).to be(:Player_two)
    end

    it 'sets player two\'s name to "Computer" by default' do
      game.set_names(:Player_one, nil)
      expect(game.player2_name).to eq('Computer')
    end
  end

  context '#set_choice' do
    it 'sets player 1\'s choice' do
      game.set_player_choice(:rock)
      expect(game.player1_choice).to be(:rock)
    end

    it 'sets player2\'s choice' do
      game.set_player_choice(:rock)
      game.set_player_choice(:paper)
      expect(game.player2_choice).to be(:paper)
    end

    it 'raises error if choice is invalid' do
      expect{ game.set_player_choice(:fish) }.to raise_error Game::SET_CHOICE_ERROR
    end
  end

  context '#set_computer_choice' do
    it 'sets player 2\'s choice' do
      game.set_computer_choice
      expect(Game::CHOICES).to include(game.player2_choice)
    end
  end

  context '#winner (player1)' do
    before :each do
      game.set_names(:player_one, :player_two)
    end
    it 'sets winner for player1: rock, player2: rock' do
      game.set_player_choice(:rock)
      game.set_player_choice(:rock)
      expect(game.winner).to eq 'Draw!'
    end
    it 'sets winner for player1: rock, player2: paper' do
      game.set_player_choice(:rock)
      game.set_player_choice(:paper)
      expect(game.winner).to eq :player_two
    end
    it 'sets winner for player1: rock, player2: scissors' do
      game.set_player_choice(:rock)
      game.set_player_choice(:scissors)
      expect(game.winner).to eq :player_one
    end
    it 'sets winner for player1: rock, player2: lizard' do
      game.set_player_choice(:rock)
      game.set_player_choice(:lizard)
      expect(game.winner).to eq :player_one
    end
    it 'sets winner for player1: rock, player2: spock' do
      game.set_player_choice(:rock)
      game.set_player_choice(:spock)
      expect(game.winner).to eq :player_two
    end
    it 'sets winner for player1: paper, player2: rock' do
      game.set_player_choice(:paper)
      game.set_player_choice(:rock)
      expect(game.winner).to eq :player_one
    end
    it 'sets winner for player1: paper, player2: paper' do
      game.set_player_choice(:paper)
      game.set_player_choice(:paper)
      expect(game.winner).to eq 'Draw!'
    end
    it 'sets winner for player1: paper, player2: scissors' do
      game.set_player_choice(:paper)
      game.set_player_choice(:scissors)
      expect(game.winner).to eq :player_two
    end
    it 'sets winner for player1: paper, player2: lizard' do
      game.set_player_choice(:paper)
      game.set_player_choice(:lizard)
      expect(game.winner).to eq :player_two
    end
    it 'sets winner for player1: paper, player2: spock' do
      game.set_player_choice(:paper)
      game.set_player_choice(:spock)
      expect(game.winner).to eq :player_one
    end
    it 'sets winner for player1: scissors, player2: rock' do
      game.set_player_choice(:scissors)
      game.set_player_choice(:rock)
      expect(game.winner).to eq :player_two
    end
    it 'sets winner for player1: scissors, player2: paper' do
      game.set_player_choice(:scissors)
      game.set_player_choice(:paper)
      expect(game.winner).to eq :player_one
    end
    it 'sets winner for player1: scissors, player2: scissors' do
      game.set_player_choice(:scissors)
      game.set_player_choice(:scissors)
      expect(game.winner).to eq 'Draw!'
    end
    it 'sets winner for player1: scissors, player2: lizard' do
      game.set_player_choice(:scissors)
      game.set_player_choice(:lizard)
      expect(game.winner).to eq :player_one
    end
    it 'sets winner for player1: scissors, player2: spock' do
      game.set_player_choice(:scissors)
      game.set_player_choice(:spock)
      expect(game.winner).to eq :player_two
    end
    it 'sets winner for player1: lizard, player2: rock' do
      game.set_player_choice(:lizard)
      game.set_player_choice(:rock)
      expect(game.winner).to eq :player_two
    end
    it 'sets winner for player1: lizard, player2: paper' do
      game.set_player_choice(:lizard)
      game.set_player_choice(:paper)
      expect(game.winner).to eq :player_one
    end
    it 'sets winner for player1: lizard, player2: scissors' do
      game.set_player_choice(:lizard)
      game.set_player_choice(:scissors)
      expect(game.winner).to eq :player_two
    end
    it 'sets winner for player1: lizard, player2: lizard' do
      game.set_player_choice(:lizard)
      game.set_player_choice(:lizard)
      expect(game.winner).to eq 'Draw!'
    end
    it 'sets winner for player1: lizard, player2: spock' do
      game.set_player_choice(:lizard)
      game.set_player_choice(:spock)
      expect(game.winner).to eq :player_one
    end
    it 'sets winner for player1: spock, player2: rock' do
      game.set_player_choice(:spock)
      game.set_player_choice(:rock)
      expect(game.winner).to eq :player_one
    end
    it 'sets winner for player1: spock, player2: paper' do
      game.set_player_choice(:spock)
      game.set_player_choice(:paper)
      expect(game.winner).to eq :player_two
    end
    it 'sets winner for player1: spock, player2: scissors' do
      game.set_player_choice(:spock)
      game.set_player_choice(:scissors)
      expect(game.winner).to eq :player_one
    end
    it 'sets winner for player1: spock, player2: lizard' do
      game.set_player_choice(:spock)
      game.set_player_choice(:lizard)
      expect(game.winner).to eq :player_two
    end
    it 'sets winner for player1: spock, player2: spock' do
      game.set_player_choice(:spock)
      game.set_player_choice(:spock)
      expect(game.winner).to eq 'Draw!'
    end
  end


end
