class AddAppartmentToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :appartment, :string
  end
end
