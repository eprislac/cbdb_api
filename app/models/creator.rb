class Creator < ApplicationRecord
  validates :last_name, presence: true, uniqueness: true
  validates :first_name, presence: true, uniqueness: true
end
