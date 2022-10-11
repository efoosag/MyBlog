class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, foreign_key: :post_id, dependent: :destroy
  has_many :likes, foreign_key: :post_id, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter
<<<<<<< HEAD

=======
>>>>>>> 6ead96391afbf69f1dafd7a617afbbd72d8f2725
  def five_most_recent_comments
    comments.order(updated_at: :desc).limit(5)
  end

  private

  def update_post_counter
    user.increment!(:post_counter)
  end
end
