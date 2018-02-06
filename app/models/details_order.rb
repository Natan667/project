class DetailsOrder < ApplicationRecord
	belongs_to :detail
	belongs_to :order
end
