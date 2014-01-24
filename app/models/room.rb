class Room < ActiveRecord::Base

	# assicoation
	belongs_to :user

	# this is from the rubycoder.org site
	geocoded_by :address
	after_validation :geocode

	# add in paperclip to save images
	#  the hash after 960x300 means we crop the image
	# if we want it to be a certain width: "500x"
	# if we want a certain height: "x500"
	has_attached_file :image, styles: {large: "960x300#", thumbnail: "50x50x"}

	# vailidations
	validates :title, presence: true
	validates :address, presence: true
	validates :price, presence: true, 
		numericality: { greater_than_or_equal_to: 0.5 }





end
