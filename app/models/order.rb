class Order < ApplicationRecord
	belongs_to :author, class_name: "User"
	has_many :details_orders
	has_many :details, :through => :details_orders

	def self.search(search)
    	where("lower(title) LIKE ?", "%#{search}%")
  	end
end