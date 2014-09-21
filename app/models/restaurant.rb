class Restaurant < ActiveRecord::Base
	has_many :orders, dependent: :destroy
	belongs_to :user

	validates :name, presence: true
	validates :category, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :country, presence: true
	validates :zip, presence: true

end
