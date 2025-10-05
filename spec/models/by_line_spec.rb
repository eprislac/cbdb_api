require 'rails_helper'

RSpec.describe ByLine, type: :model do
  let!(:by_line) { ByLine.create(name: 'Writer') }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:credits) }
end
