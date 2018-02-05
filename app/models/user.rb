class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

  def self.search(search)
    where("lower(username) LIKE ?", "%#{search}%")
    end
    
  has_many :details, foreign_key: :author_id
  has_many :orders, foreign_key: :author_id
  
end
