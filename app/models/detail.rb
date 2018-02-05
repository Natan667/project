class Detail < ApplicationRecord
	belongs_to :author, class_name: "User"

	def self.search(search)
    	where("lower(title) LIKE ?", "%#{search}%")
  	end
end
