require 'game'

describe 'Game outcomes' do
  subject(:game){ Game.new(:mode, players) }

  let(:player1){ double(:player1, name: :player_one) }
  let(:player2){ double(:player2, name: :player_two) }
  let(:players){ [player1, player2] }



  context 'player1 chooses rock' do
    before(:each) do
      allow(player1).to receive(:choice) {:rock}
    end
    it 'sets winner for player1: rock, player2: rock' do
      allow(player2).to receive(:choice) {:rock}
      expect(game.winner).to eq Game::DRAW_MSG
    end
    it 'sets winner for player1: rock, player2: paper' do
      allow(player2).to receive(:choice) {:paper}
      expect(game.winner).to be :player_two
    end
    it 'sets winner for player1: rock, player2: scissors' do
      allow(player2).to receive(:choice) {:scissors}
      expect(game.winner).to be :player_one
    end
    it 'sets winner for player1: rock, player2: lizard' do
      allow(player2).to receive(:choice) {:lizard}
      expect(game.winner).to be :player_one
    end
    it 'sets winner for player1: rock, player2: spock' do
      allow(player2).to receive(:choice) {:spock}
      expect(game.winner).to be :player_two
    end
  end

  context 'player1 chooses paper' do
    before(:each) do
      allow(player1).to receive(:choice) {:paper}
    end
    it 'sets winner for player1: paper, player2: rock' do
      allow(player2).to receive(:choice) {:rock}
      expect(game.winner).to be :player_one
    end
    it 'sets winner for player1: paper, player2: paper' do
      allow(player2).to receive(:choice) {:paper}
      expect(game.winner).to eq Game::DRAW_MSG
    end
    it 'sets winner for player1: paper, player2: scissors' do
      allow(player2).to receive(:choice) {:scissors}
      expect(game.winner).to be :player_two
    end
    it 'sets winner for player1: paper, player2: lizard' do
      allow(player2).to receive(:choice) {:lizard}
      expect(game.winner).to be :player_two
    end
    it 'sets winner for player1: paper, player2: spock' do
      allow(player2).to receive(:choice) {:spock}
      expect(game.winner).to be :player_one
    end
  end

  context 'player1 chooses scissors' do
    before(:each) do
      allow(player1).to receive(:choice) {:scissors}
    end
    it 'sets winner for player1: scissors, player2: rock' do
      allow(player2).to receive(:choice) {:rock}
      expect(game.winner).to be :player_two
    end
    it 'sets winner for player1: scissors, player2: paper' do
      allow(player2).to receive(:choice) {:paper}
      expect(game.winner).to be :player_one
    end
    it 'sets winner for player1: scissors, player2: scissors' do
      allow(player2).to receive(:choice) {:scissors}
      expect(game.winner).to eq Game::DRAW_MSG
    end
    it 'sets winner for player1: scissors, player2: lizard' do
      allow(player2).to receive(:choice) {:lizard}
      expect(game.winner).to be :player_one
    end
    it 'sets winner for player1: scissors, player2: spock' do
      allow(player2).to receive(:choice) {:spock}
      expect(game.winner).to be :player_two
    end
  end

  context 'player1 chooses lizard' do
    before(:each) do
      allow(player1).to receive(:choice) {:lizard}
    end
    it 'sets winner for player1: lizard, player2: rock' do
      allow(player2).to receive(:choice) {:rock}
      expect(game.winner).to be :player_two
    end
    it 'sets winner for player1: lizard, player2: paper' do
      allow(player2).to receive(:choice) {:paper}
      expect(game.winner).to be :player_one
    end
    it 'sets winner for player1: lizard, player2: scissors' do
      allow(player2).to receive(:choice) {:scissors}
      expect(game.winner).to be :player_two
    end
    it 'sets winner for player1: lizard, player2: lizard' do
      allow(player2).to receive(:choice) {:lizard}
      expect(game.winner).to eq Game::DRAW_MSG
    end
    it 'sets winner for player1: lizard, player2: spock' do
      allow(player2).to receive(:choice) {:spock}
      expect(game.winner).to be :player_one
    end
  end

  context 'player1 chooses spock' do
    before(:each) do
      allow(player1).to receive(:choice) {:spock}
    end
    it 'sets winner for player1: spock, player2: rock' do
      allow(player2).to receive(:choice) {:rock}
      expect(game.winner).to be :player_one
    end
    it 'sets winner for player1: spock, player2: paper' do
      allow(player2).to receive(:choice) {:paper}
      expect(game.winner).to be :player_two
    end
    it 'sets winner for player1: spock, player2: scissors' do
      allow(player2).to receive(:choice) {:scissors}
      expect(game.winner).to be :player_one
    end
    it 'sets winner for player1: spock, player2: lizard' do
      allow(player2).to receive(:choice) {:lizard}
      expect(game.winner).to be :player_two
    end
    it 'sets winner for player1: spock, player2: spock' do
      allow(player2).to receive(:choice) {:spock}
      expect(game.winner).to eq Game::DRAW_MSG
    end
  end

end
