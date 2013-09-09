# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ActiveRecord::Base
  attr_accessible :name, :tag_id
	belongs_to :tag
	has_many :products
end
