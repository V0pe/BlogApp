class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
  end
end
