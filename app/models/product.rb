# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  number     :string(255)
#  content    :text
#  use        :string(255)
#  load       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ActiveRecord::Base
  attr_accessible :content, :load, :number, :title, :use, :photos_attributes

	validates :title, presence: true, length: { maximum: 50 }
	validates :number, presence: true, uniqueness: true
	validates :content, presence: true
	validates :use, presence: true
	validates :load, presence: true

	has_many :photos
	has_many :line_items
	has_many :product_users
	accepts_nested_attributes_for :photos
end
