require 'rails_helper'

RSpec.describe Publisher, type: :model do
  it { should validate_presence_of(:name) }
  let!(:publisher) { Publisher.create(name: 'Marvel Comics') }
  it { should validate_uniqueness_of(:name) }
end
