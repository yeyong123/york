# == Schema Information
#
# Table name: carts
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  remember_token :string(255)
#

class Cart < ActiveRecord::Base
  # attr_accessible :title, :bodyhas_many :line_items, dependent: :destroy
	belongs_to :user
	has_many :line_items, dependent: :destroy

	def add_product(product_id)
		current_item = line_items.find_by_product_id(product_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(product_id: product_id)
		end
		current_item
	end

	def total_items
		line_items.sum(:quantity)
	end
end
