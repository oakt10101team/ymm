class CreateReataurantsCategoriesJoinTable < ActiveRecord::Migration
  def change
  	create_table :categories_restaurants, id: false do |t|
      t.belongs_to :category
      t.belongs_to :restaurant
    end
  end
end
