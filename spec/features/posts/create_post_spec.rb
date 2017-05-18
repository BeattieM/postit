require 'rails_helper'

describe 'the create process', type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  it 'creates a new Post' do
    sign_in_as_user(user)

    visit '/posts/new'
    within('.new_post') do
      fill_in 'Title', with: 'My Title'
      fill_in 'post_body', with: 'My Body'
    end
    click_button 'Submit'

    visit "/posts/#{Post.last.uuid}"
    expect(page).to have_content "#{user.first_name} #{user.last_name}"
    expect(page).to have_content 'My Title'
    expect(page).to have_content 'My Body'
  end
end
