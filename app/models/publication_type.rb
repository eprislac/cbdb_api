class PublicationType < ApplicationRecord
  has_many :publications, dependent: :nullify
  validates :name, presence: true, uniqueness: true
end
