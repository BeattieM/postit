require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'loads all of the posts into @posts' do
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:post)
      get :index

      expect(assigns(:posts)).to match_array([post1, post2])
    end
  end

  describe 'GET #my' do
    login_user

    it 'responds successfully with an HTTP 200 status code' do
      get :my
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the my template' do
      get :my
      expect(response).to render_template('my')
    end

    it 'loads all of the posts into @posts belonging to the logged in user' do
      post1 = FactoryGirl.create(:post, author: subject.current_user)
      post2 = FactoryGirl.create(:post)
      get :my

      expect(assigns(:posts)).to match_array([post1])
      expect(assigns(:posts)).to_not match_array([post1, post2])
    end
  end

  describe 'GET #show' do
    before(:each) do
      @post = FactoryGirl.create(:post)
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :show, id: @post.uuid
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the my template' do
      get :show, id: @post.uuid
      expect(response).to render_template('show')
    end

    it 'loads the specific Post that was supplied in the URL' do
      get :show, id: @post.uuid

      expect(assigns(:post)).to eq(@post)
    end
  end
end
