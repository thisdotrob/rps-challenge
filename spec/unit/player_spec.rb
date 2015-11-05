require 'player'

describe Player do
  subject(:player){ Player.new }

  context '#set_name' do
    it 'sets the player\'s name' do
      player.set_name(:name)
      expect(player.name).to be (:name)
    end
  end

  context '#set_choice' do
    it 'sets the player\'s choice' do
      player.set_choice(:choice)
      expect(player.choice).to be (:choice)
    end
  end

  context '#chosen?' do
    it 'returns true unless @choice is nil' do
      player.set_choice(:choice)
      expect(player).to be_chosen
    end
  end

end
