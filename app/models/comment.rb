class Comment < ActiveRecord::Base
	belongs_to :poi
	belongs_to :user

  validates :text, presence: true
  validates :user, presence: true
end
