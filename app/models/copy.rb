class Copy < ApplicationRecord
  belongs_to :issue
  belongs_to :condition
  belongs_to :collection
  belongs_to :cover
end
