# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean
#  name                   :string(255)
#

class User < ActiveRecord::Base
	include Likeable::UserMethods
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :product_users
	has_one :cart
	has_one :customer

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
