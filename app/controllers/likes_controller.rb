class LikesController < ApplicationController
 # def create
  #  @post = Post.find(params[:id])
   # @like = @post.likes.new
   # @like.post_id = @post.id
   # @like.author_id = @user.id
   # @like.save
   # redirect_to "/users/#{current_user.id}/posts/#{@post.id}"
  #end
  def create
    @like = Like.new(like_params)
    redirect_to user_post_path(id: @like.post_id, user_id: @like.author_id) if @like.save
  end

  private

  def like_params
    params.require(:like).permit(:author_id, :post_id)
  end
end
