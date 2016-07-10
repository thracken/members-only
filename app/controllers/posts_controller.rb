class PostsController < ApplicationController
  before_action :check_logged_in, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
  end

  def index
    @posts = Post.all
  end

  private
    def check_logged_in
      logged_in?
    end
end
