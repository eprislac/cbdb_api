class Creator < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name, uniqueness: { scope: :first_name }
end
