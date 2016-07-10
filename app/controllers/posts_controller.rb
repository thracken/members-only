class PostsController < ApplicationController
  before_action :check_logged_in, only: [:new, :create]

  def new
  end

  def create
  end

  def index
  end

  private
    def check_logged_in
      logged_in?
    end
end
