# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(1)
#

class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id
	belongs_to :product
	belongs_to :cart
end
