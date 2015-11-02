feature '/play' do
  context 'player choice' do
    scenario 'allows the player to choose rock' do
      enter_name_and_play
      click_link('rock.jpg')
      expect(page).to have_content 'playerX\'s choice: rock.'
    end
    scenario 'allows the player to choose paper' do
      enter_name_and_play
      click_link('paper.jpg')
      expect(page).to have_content 'playerX\'s choice: paper.'
    end
    scenario 'allows the player to choose scissors' do
      enter_name_and_play
      click_link('scissors.jpg')
      expect(page).to have_content 'playerX\'s choice: scissors.'
    end
  end

  context 'computer wins' do
    scenario 'when player = rock & computer = paper' do
      allow(Kernel).to receive(:rand) { 0.665 }
      enter_name_and_play
      click_link('rock.jpg')
      expect(page).to have_content 'Computer wins!'
    end
    scenario 'when player = paper & computer = scissors' do
      allow(Kernel).to receive(:rand) { 0.999 }
      enter_name_and_play
      click_link('paper.jpg')
      expect(page).to have_content 'Computer wins!'
    end
    scenario 'when player = scissors & computer = rock' do
      allow(Kernel).to receive(:rand) { 0.332 }
      enter_name_and_play
      click_link('scissors.jpg')
      expect(page).to have_content 'Computer wins!'
    end
  end

  context 'player wins' do
    scenario 'when computer = rock & player = paper' do
      allow(Kernel).to receive(:rand) { 0.332 }
      enter_name_and_play
      click_link('paper.jpg')
      expect(page).to have_content 'playerX wins!'
    end
    scenario 'when computer = paper & player = scissors' do
      allow(Kernel).to receive(:rand) { 0.665 }
      enter_name_and_play
      click_link('scissors.jpg')
      expect(page).to have_content 'playerX wins!'
    end
    scenario 'when computer = scissors & player = rock' do
      allow(Kernel).to receive(:rand) { 0.999 }
      enter_name_and_play
      click_link('rock.jpg')
      expect(page).to have_content 'playerX wins!'
    end
  end

  context 'Nobody wins' do
    scenario 'when player = rock & computer = rock' do
      allow(Kernel).to receive(:rand) { 0.332 }
      enter_name_and_play
      click_link('rock.jpg')
      expect(page).to have_content 'Nobody wins!'
    end
    scenario 'when player = paper & computer = paper' do
      allow(Kernel).to receive(:rand) { 0.665 }
      enter_name_and_play
      click_link('paper.jpg')
      expect(page).to have_content 'Nobody wins!'
    end
    scenario 'when player = scissors & computer = scissors' do
      allow(Kernel).to receive(:rand) { 0.999 }
      enter_name_and_play
      click_link('scissors.jpg')
      expect(page).to have_content 'Nobody wins!'
    end
  end

end