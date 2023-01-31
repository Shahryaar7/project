class AddWebsiteToCafeRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :cafe_restaurants, :website, :string
  end
end
