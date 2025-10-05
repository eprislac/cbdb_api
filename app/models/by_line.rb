class ByLine < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :credits
end
