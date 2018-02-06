class Order < ApplicationRecord
	belongs_to :author, class_name: "User"
	has_and_belongs_to_many :details

	def self.search(search)
    	where("lower(title) LIKE ?", "%#{search}%")
  	end
end
