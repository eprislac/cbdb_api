require 'rails_helper'

RSpec.describe Credit, type: :model do
  it { should belong_to(:by_line) }
  it { should belong_to(:creator) }
  it { should belong_to(:issue) }
end
