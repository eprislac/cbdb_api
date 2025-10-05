class Issue < ApplicationRecord
  belongs_to :publication
  has_many :credits, dependent: :destroy
  has_many :creators, through: :credits
  has_many :covers, dependent: :destroy
end
