class Tour < ActiveRecord::Base
	belongs_to :creator, class_name: "User"
	has_many :poi
	has_many :comments, through: :poi

  validates :name, presence: true, length: {in: 2..20}
  validates :center, presence: true
  validates :creator, presence: true

end
