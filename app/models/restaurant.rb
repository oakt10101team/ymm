class Restaurant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
	
	has_many :orders, dependent: :destroy
	has_and_belongs_to_many :categories

end
