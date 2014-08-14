class Poi < ActiveRecord::Base
	belongs_to :tour

  validates :tour, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: {in: 5..2000}
  validates :location, presence: true, uniqueness: true
  validates :image, presence: true, uniqueness: true
end
