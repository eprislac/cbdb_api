class User < ApplicationRecord
  has_many :collections, dependent: :destroy
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :name, presence: true

  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end
end
