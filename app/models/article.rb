class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  def created_by?(user)
    return true if user_id == user.id
  end
end
