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
