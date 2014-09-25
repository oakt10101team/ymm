class RemoveCategoriesFromRestaurants < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :category_ids
  end
end
