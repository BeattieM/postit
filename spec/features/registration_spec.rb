describe 'the registration process', type: :feature do
  it 'registers a new user' do
    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'Email', with: 'test@test.com'
      fill_in 'First name', with: 'Bobby'
      fill_in 'Last name', with: 'McTester'
      fill_in 'Password', with: 'qazwsx'
      fill_in 'Password confirmation', with: 'qazwsx'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Logout'
  end
end
