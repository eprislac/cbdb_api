class ByLine < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
