class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :restaurants, dependent: :destroy

  def to_s
  	"#{first_name} #{last_name}"
  end
end
