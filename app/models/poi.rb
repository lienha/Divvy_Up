class Poi < ActiveRecord::Base
  belongs_to :tour
  has_many :comments
  accepts_nested_attributes_for :comments
  serialize :location, JSON
  validates :tour, presence: true
  validates :name, presence: true
  validates :description, presence: true, length: {in: 5..2000}
  validates :location, presence: true
  validates :image, presence: true
end
