class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', counter_cache: :comments_counter
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
