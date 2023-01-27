class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :cafe_restaurant

  enum :role_type, { admin: "admin", chef: "chef", waiter: "waiter" }
end
