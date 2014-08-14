class User < ActiveRecord::Base
	has_many :tours
	has_many :comments 
end
