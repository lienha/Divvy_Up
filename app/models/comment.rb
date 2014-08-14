class Comment < ActiveRecord::Base
	belongs_to :poi
	belongs_to :user 
end
