class User < ApplicationRecord
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :user_roles
  has_many :cafe_restaurants, through: :user_roles

  validates :name, presence: true
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 },
            format: { with: EMAIL_REGEX , message: "Invalid Email format" }

  scope :by_name, ->(letters) { where("name ILIKE ?","%#{letters}%") }


end
