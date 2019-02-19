class Event < ApplicationRecord
	belongs_to :user
	validates :title, presence: true,length:{ in:5..140}
	validates :description, presence: true ,length:{ in:20..1000}
	validates :start_date,presence:true
	validates :price ,presence:true 
	validates :location ,presence:true 
	  has_many :attendances
      has_many :users, through: :attendances
      has_one_attached :avatar

end
