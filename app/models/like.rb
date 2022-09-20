class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  after_save :update_like_counter

  def update_like_counter
    post.increment_counter(:likes_counter, 1)
  end
end
