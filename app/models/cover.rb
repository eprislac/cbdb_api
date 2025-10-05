class Cover < ApplicationRecord
  belongs_to :issue, dependent: :destroy
  has_many :copies
end
