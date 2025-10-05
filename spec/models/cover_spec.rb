require 'rails_helper'

RSpec.describe Cover, type: :model do
  it { should belong_to(:issue) }
  it { should have_many(:copies) }
end
