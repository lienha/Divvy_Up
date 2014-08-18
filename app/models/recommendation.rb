class Recommendation < ActiveRecord::Base
  belongs_to :tour
  belongs_to :user  

  validates :text, presence: true, length: {in: 3..800}
  validates :user, presence: true
end
