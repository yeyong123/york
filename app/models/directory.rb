class Directory < ActiveRecord::Base
  attr_accessible :customer_id, :zip, :address, :city_id, :company, :district_id, :email, :hangye, :name, :phone, :province_id, :tel, :telphoneumber
	belongs_to :customer
	belongs_to :province
	belongs_to :city
	belongs_to :district
	HANGYE = ["制造业","服务业", "矿产", "建筑业", "物流"]
	validates :hangye, inclusion: HANGYE
	VALID_PHONE = /^(1(([35][0-9])|(47)|[8][01236789]))\d{8}$/
	VALID_TELPHOME = /^\d{7,8}$/
	VALID_TEL = /^\d{3}$/
	VALID_ZIP = /^0\d{2,3}$/

	validates :phone, presence: true,
 		format: {with: VALID_PHONE},
		uniqueness: {case_sensitive: false}

	validates :telphoneumber, presence: true,
		format: {with: VALID_TELPHOME}

	validates :tel, presence: false, format: {with: VALID_TEL}

	validates :zip, format: {with: VALID_ZIP}

end
