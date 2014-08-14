class Poi < ActiveRecord::Base
	belongs_to :tour
  serialize :location, JSON
  validates :tour, presence: true
  validates :name, presence: true
  validates :description, presence: true, length: {in: 5..2000}
  validates :location, presence: true
  validates :image, presence: true
end
