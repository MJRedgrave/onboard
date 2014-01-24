class AddUserIdToRooms < ActiveRecord::Migration
  def change
  	# add column to :table, :what it is, :type 
  	add_column :rooms, :user_id, :integer
  end
end
