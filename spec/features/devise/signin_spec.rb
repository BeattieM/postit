require 'rails_helper'

describe 'the signin process', type: :feature do
  it 'signs me in if I have an account' do
    sign_in_as_user(FactoryGirl.create(:user))
    expect(page).to have_content 'Logout'
  end

  it 'does not sign me in if I do not have an account' do
    sign_in_as_user(User.new)
    expect(page).to have_content 'Invalid Email or password'
  end
end
