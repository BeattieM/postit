module FeatureMacros
  def sign_in_as_user(user)
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Log in'
  end
end
