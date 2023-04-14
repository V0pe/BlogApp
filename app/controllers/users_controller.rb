class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @recent_post = Post.where(author_id: params[:id]).order(created_at: :desc).limit(3)
    @user = User.find(params[:id])
  end
end
