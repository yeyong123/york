# == Schema Information
#
# Table name: product_users
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(1)
#

class ProductUser < ActiveRecord::Base
  attr_accessible :product_id, :user_id
	belongs_to :user
	belongs_to :product
end
