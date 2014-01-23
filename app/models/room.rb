class Room < ActiveRecord::Base

	# this is from the rubycoder.org site
	geocoded_by :address
	after_validation :geocode

	# vailidations
	validates :title, presence: true
	validates :address, presence: true
	validates :price, presence: true, 
		numericality: { greater_than_or_equal_to: 0.5 }





end
