class Publication < ApplicationRecord
  belongs_to :publication_type
  belongs_to :publisher
  has_many :issues, dependent: :destroy
  validates :title, presence: true, uniqueness: true
end
