class Order < ApplicationRecord
  before_save :default_values
  belongs_to :author, class_name: "User"
	has_many :details_orders
	has_many :details, :through => :details_orders, dependent: :destroy

  def default_values
    self.status ||= 'New'
  end

	def self.search(search)
    where("lower(car) LIKE ? OR lower(title) LIKE ? OR lower(name) LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", )
  end

end