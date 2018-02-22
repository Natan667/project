class Detail < ApplicationRecord
	belongs_to :author, class_name: "User"
	has_many :details_orders
	has_many :orders, :through => :details_orders, dependent: :destroy

	def self.search(search)
    	where("lower(title) LIKE ?", "%#{search}%")
  	end

end
