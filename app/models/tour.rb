class Tour < ActiveRecord::Base
	belongs_to :creator, class_name: "User"
	has_many :pois
	has_many :comments, through: :pois
  serialize :center, JSON
  validates :name, presence: true, length: {in: 2..20}
  validates :center, presence: true
  validates :creator, presence: true

end
