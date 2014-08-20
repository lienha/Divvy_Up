class Vote < ActiveRecord::Base
  belongs_to :recommendation, dependent: :destroy
  belongs_to :user, dependent: :destroy 

  validates_presence_of :value 
  validates :user_id, :uniqueness => {:scope => [:recommendation_id]}
end
