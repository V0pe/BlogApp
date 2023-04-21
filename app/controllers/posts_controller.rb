class PostsController < ApplicationController
  def index
    @posts = @user.posts.includes(:comments, :author)
    @user = User.find(params[:user_id])
    @user_posts = Post.where(author_id: params[:user_id]).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
    @params = params
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to user_posts_path(id: @post.id, user_id: @post.author_id)

    else
      render :new, status: :unprocessable_entity, content_type: 'text/html'
      headers['Content-Type'] = 'text/html'
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :text, :author_id).merge(likes_counter: 0, comments_counter: 0)
  end
end
