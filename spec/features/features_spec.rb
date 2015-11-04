feature 'Select mode' do
  scenario 'sets two player mode' do
    visit('/')
    click_button 'Two player'
    expect(page).to have_content 'Two player mode selected.'
  end

  scenario 'sets single player mode' do
    visit('/')
    click_button 'Single player'
    expect(page).to have_content 'Single player mode selected.'
  end
end

feature 'Enter names' do
  scenario 'allows user to enter name in single player mode' do
    visit('/')
    click_button 'Single player'
    fill_in :player1_name, with: 'Player_one'
    click_button 'Submit'
    expect(page).to have_content 'Player one: Player_one'
  end

  scenario 'allows user to enter two names in two player mode' do
    visit('/')
    click_button 'Two player'
    fill_in :player1_name, with: 'Player_one'
    fill_in :player2_name, with: 'Player_two'
    click_button 'Submit'
    expect(page).to have_content 'Player one: Player_one'
    expect(page).to have_content 'Player two: Player_two'
  end
end

feature 'Make choice' do
  scenario 'prompts player 1 to make choice first in single player mode' do
    visit('/')
    click_button 'Single player'
    fill_in :player1_name, with: 'Player_one'
    click_button 'Submit'
    click_button 'Play'
    expect(page).to have_content 'Make your choice:'
  end

  scenario 'prompts player 1 to make choice first in two player mode' do
    visit('/')
    click_button 'Two player'
    fill_in :player1_name, with: 'Player_one'
    fill_in :player2_name, with: 'Player_two'
    click_button 'Submit'
    click_button 'Play'
    expect(page).to have_content 'Make your choice Player_one:'
  end

  scenario 'prompts player 2 to make choice second in two player mode' do
    visit('/')
    click_button 'Two player'
    fill_in :player1_name, with: 'Player_one'
    fill_in :player2_name, with: 'Player_two'
    click_button 'Submit'
    click_button 'Play'
    click_button 'rock'
    expect(page).to have_content 'Make your choice Player_two:'
  end
end

feature 'Game result' do
  scenario 'displays player and computer\'s choices in one player mode' do
    allow(Game::CHOICES).to receive(:sample) { :paper }
    visit('/')
    click_button 'Single player'
    fill_in :player1_name, with: 'Player_one'
    click_button 'Submit'
    click_button 'Play'
    click_button 'rock'
    expect(page).to have_content 'Player_one\'s choice: rock'
    expect(page).to have_content 'Computer\'s choice: paper'
  end

  scenario 'displays player 1 and player 2\'s choices in two player mode' do
    visit('/')
    click_button 'Two player'
    fill_in :player1_name, with: 'Player_one'
    fill_in :player2_name, with: 'Player_two'
    click_button 'Submit'
    click_button 'Play'
    click_button 'rock'
    click_button 'rock'
    expect(page).to have_content 'Player_one\'s choice: rock'
    expect(page).to have_content 'Player_two\'s choice: rock'
  end
end

feature 'Outcome' do
  scenario 'displays a win' do
    visit('/')
    click_button 'Two player'
    fill_in :player1_name, with: 'Player_one'
    fill_in :player2_name, with: 'Player_two'
    click_button 'Submit'
    click_button 'Play'
    click_button 'rock'
    click_button 'paper'
    expect(page).to have_content 'Player_two wins!'
  end
end
