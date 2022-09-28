class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      #@post.user.id = session[:user_id]
      flash[:session] = "New Post created"
      redirect_to '/'
    else
      render 'new'
    end
    #@post = Post.new(post_params, user_id = params[:user_id])
  end

  def index
    @posts = Post.all
    @posts.each do |post|
      post.title
      post.body
      post.user_id
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user, :user_id)
  end
end
