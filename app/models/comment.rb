class Comment < ActiveRecord::Base
	belongs_to :poi
	belongs_to :user

  validates :text, presence: true, length: {in: 3..300}
  validates :user, presence: true
end
