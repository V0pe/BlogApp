class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: :posts_counter
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def user_name
    author.name
  end

  def user_posts_counter
    author.posts_counter
  end

  def user_id
    author.id
  end

  def all_comments
    comments.order(created_at: :desc)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
