# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :name, :tags_attributes
	has_many :tags, dependent: :destroy
	accepts_nested_attributes_for :tags
	Name = ["高空作业平台", "堆高设备", "搬运设备"]
	validates :name, inclusion: Name
end
