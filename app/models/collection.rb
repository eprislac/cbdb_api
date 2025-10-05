class Collection < ApplicationRecord
  belongs_to :user
  has_many :copies, dependent: :destroy
end
