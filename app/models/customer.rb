class Customer < ActiveRecord::Base
 attr_accessible :user_id, :directories_attributes
	belongs_to :user
	has_many :directories

	accepts_nested_attributes_for :directories
end
