class CreateUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_roles do |t|
      t.string :role_type
      t.references :user, null: false, foreign_key: true
      t.references :cafe_restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
