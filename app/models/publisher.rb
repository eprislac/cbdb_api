class Publisher < ApplicationRecord
  has_many :publications, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
