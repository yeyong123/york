class Customer < ActiveRecord::Base
	attr_accessible :user_id, :directories_attributes, :province_id, :city_id, :district_id, :address
	belongs_to :province
	belongs_to :city
	belongs_to :district
	belongs_to :user
	has_many :directories
	accepts_nested_attributes_for :directories
end
