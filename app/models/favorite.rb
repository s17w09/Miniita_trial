class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :favorite_type, presence: true
end
