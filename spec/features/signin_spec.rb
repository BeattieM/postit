describe 'the signin process', type: :feature do
  it 'signs me in if I have an account' do
    sign_in_as_user(FactoryGirl.create(:user))
    expect(page).to have_content 'Logout'
  end

  it 'does not sign me in if I do not have an account' do
    sign_in_as_user
    expect(page).to have_content 'Invalid Email or password'
  end

  def sign_in_as_user(user = User.new)
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Log in'
  end
end
