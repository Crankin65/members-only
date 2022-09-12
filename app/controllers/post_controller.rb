class PostController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_id = params[:user_id])
  end

  def index
    @posts = Post.all
  end

  private

  def require_login

  end

  def post_params
    params.require(:post).permit(:title, :body, :user, :user_id)
  end
end
