class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  after_save :update_comment_counter

  def update_comment_counter
    post.increment_counter(:comments_counter, 1)
  end
end
