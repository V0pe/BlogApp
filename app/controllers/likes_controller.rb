class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    if @like.save
      @post = @like.post
      @post.decrement!(:likes_counter)
      redirect_to user_post_path(@post.author, @post)
    else
      render :new
    end
  end

  private

  def like_params
    params.require(:like).permit(:author_id, :post_id)
  end
end
