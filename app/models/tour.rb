class Tour < ActiveRecord::Base
	belongs_to :creator, class_name: "User"
	belongs_to :poi
	has_many :comments through: :poi 
end
