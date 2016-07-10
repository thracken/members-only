class PostsController < ApplicationController
  before_action :check_logged_in, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  private
    def check_logged_in
      logged_in?
    end

    def post_params
      params.require(:post).permit(:title,:body,:user_id)
    end
end
