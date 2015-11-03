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
