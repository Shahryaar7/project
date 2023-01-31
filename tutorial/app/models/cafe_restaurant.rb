class CafeRestaurant < ApplicationRecord
  VALID_URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/i

  has_many :user_roles
  has_many :users, through: :user_roles

  validates :name, presence: true
  validates :website, format: { with: VALID_URL_REGEX, message: "Invalid URL format" }

  scope :by_name, ->(letters) { where("name ILIKE ?","%#{letters}%") }
  scope :active_user_roles, -> { joins(:user_roles).where("user_roles.active = ?", true) }
end
