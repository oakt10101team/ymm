class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :restaurant_id
      t.string :dish
      t.time :delivery_time
      t.date :delivery_date
      t.string :customer_phone
      t.string :customer_address
      t.string :order_status, default: "Ordered"

      t.timestamps
    end
  end
end
