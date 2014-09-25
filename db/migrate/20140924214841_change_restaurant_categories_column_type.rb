class ChangeRestaurantCategoriesColumnType < ActiveRecord::Migration
  def change
  	rename_column :restaurants, :categories, :category_ids
  	change_column :restaurants, :category_ids, :text
  end
end
