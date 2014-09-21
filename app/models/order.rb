class Order < ActiveRecord::Base
	belongs_to :restaurant

	validates :dish, presence: true
	validates :delivery_time, presence: true
	validates :delivery_date, presence: true
	validates :customer_address, presence: true
	validates :order_status, presence: true

	scope :my_all_orders, ->(restaurant_ids) { where("restaurant_id IN (?)", restaurant_ids) }
end
