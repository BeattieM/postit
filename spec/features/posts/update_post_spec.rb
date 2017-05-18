require 'rails_helper'

describe 'the update process', type: :feature do
  let(:user) { FactoryGirl.create(:user) }
  let(:post) { FactoryGirl.create(:post, author: user) }

  it 'updates an existing Post' do
    sign_in_as_user(user)

    visit "/posts/#{post.uuid}/edit"
    within('.edit_post') do
      fill_in 'Title', with: 'New Title'
      fill_in 'post_body', with: 'New Body'
    end
    click_button 'Submit'

    visit "/posts/#{post.uuid}"
    expect(page).to have_content 'New Title'
    expect(page).to have_content 'New Body'
  end
end
