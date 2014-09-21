class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :user_id
      t.string :name
      t.string :category
      t.string :address
      t.string :city
      t.string :country
      t.string :zip

      t.timestamps
    end
  end
end
