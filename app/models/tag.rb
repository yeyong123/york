# == Schema Information
#
# Table name: tags
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tag < ActiveRecord::Base
  attr_accessible :category_id, :name
	has_many :lists
	belongs_to :category
end
