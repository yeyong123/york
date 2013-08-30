class User < ActiveRecord::Base
	include Likeable::UserMethods
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :product_users

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name,:password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
	#
	def like_product(product_id)
		current_like = product_users.find_by_product_id(product_id)
		if current_like
			current_like.quantity += 1
		else
			current_like = product_users.build(product_id: product_id)
		end
		current_like
	end

	def total_like
		product_users.sum(:quantity)
	end

end
