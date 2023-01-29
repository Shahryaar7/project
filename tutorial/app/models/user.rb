class User < ApplicationRecord
  has_many :user_roles
  has_many :cafe_restaurants, through: :user_roles

  validates :name, presence: true

  scope :by_names, ->(letters) { where("name ILIKE ?","%#{letters}%") }
end
