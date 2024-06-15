class Article < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  def created_by?(user)
    return true if user_id == user.id
  end
  

  def self.ransackable_attributes(auth_object = nil)
    ["body","title"]
  end

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
