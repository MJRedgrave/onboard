class Order < ActiveRecord::Base

	# associations
	belongs_to :user
	belongs_to :room

end
