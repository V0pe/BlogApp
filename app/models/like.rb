class Like < ApplicationRecord
  belongs_to :post, class_name: 'Post', counter_cache: :likes_counter
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :update_likes_counter

  private

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
