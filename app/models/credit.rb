class Credit < ApplicationRecord
  belongs_to :by_line
  belongs_to :creator
  belongs_to :issue
end
