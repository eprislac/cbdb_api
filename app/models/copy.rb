class Copy < ApplicationRecord
  belongs_to :issue
  belongs_to :condition
end
