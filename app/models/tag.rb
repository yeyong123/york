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
  attr_accessible :category_id, :name, :lists_attributes
	has_many :lists, dependent: :destroy
	belongs_to :category
	accepts_nested_attributes_for :lists
end
