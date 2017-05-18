require 'rails_helper'

describe 'the registration process', type: :feature do
  it 'registers a new user' do
    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'Email', with: 'test@test.com'
      fill_in 'First Name', with: 'Bobby'
      fill_in 'Last Name', with: 'McTester'
      fill_in 'user_password', with: 'qazwsx'
      fill_in 'user_password_confirmation', with: 'qazwsx'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Logout'
  end
end
