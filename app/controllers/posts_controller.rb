# Controller for Post specific endpoints
class PostsController < ApplicationController
  layout "main"
  before_action :find_post_for_user, only: %i[edit destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.most_recent.page params[:page]
  end

  def my
    @posts = current_user.posts.most_recent.page params[:page]
  end

  def show
    @post = Post.find_by_uuid(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to action: 'my'
    else
      render :new
    end
  end

  def edit; end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = 'Post was successfully updated.'
      redirect_to action: 'my'
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = 'Post was successfully deleted.'
      redirect_to action: 'my'
    else
      render :new
    end
  end

  private

  def find_post_for_user
    @post = current_user.posts.find_by_uuid(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
