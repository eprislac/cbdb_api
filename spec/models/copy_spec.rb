require 'rails_helper'

RSpec.describe Copy, type: :model do
  it { should belong_to(:cover) }
  it { should belong_to(:issue) }
end
