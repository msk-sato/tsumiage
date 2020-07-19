class Report < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :cheers
  has_many :liked_by, through: :cheers, source: :user
end

