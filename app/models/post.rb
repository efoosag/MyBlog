class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def update_post_counter
    user.increment_counter(:post_counter,1)
    
  end

  def five_most_recent_comments
    comments.where(post_id: 5).last(5)
  end
end
