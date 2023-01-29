class CafeRestaurant < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  validates :name, presence: true

  scope :by_names, ->(letters) { where("name ILIKE ?","%#{letters}%") }
end
