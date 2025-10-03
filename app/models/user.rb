class User < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :items, through: :collections
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
