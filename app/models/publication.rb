class Publication < ApplicationRecord
  belongs_to :publication_type
  belongs_to :publisher
  has_many :issues, dependent: :destroy
end
