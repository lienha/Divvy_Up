class Tour < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :pois
  has_many :recommendations
  has_many :comments, through: :pois
  validates :name, presence: true, length: {in: 2..20}
  validates_presence_of :lat, :lng
  validates :creator, presence: true

end
