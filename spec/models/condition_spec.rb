require 'rails_helper'

RSpec.describe Condition, type: :model do
  it { should validate_presence_of(:name) }
  let!(:condition) { Condition.create(name: 'New') }
  it { should validate_uniqueness_of(:name) }
end
