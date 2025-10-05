require 'rails_helper'

RSpec.describe Issue, type: :model do
  it { should belong_to(:publication) }
  it { should have_many(:credits).dependent(:destroy) }
  it { should have_many(:creators).through(:credits) }
end
