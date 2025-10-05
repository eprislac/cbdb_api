require 'rails_helper'

RSpec.describe Collection, type: :model do
  let!(:user) { create(:user, email: Faker::Internet.unique.email, name: Faker::Name.name) }
  let!(:collection) { create(:collection, name: 'Main Collection', user_id: user.id) }
  it { should belong_to(:user) }
  it { should have_many(:copies) }
end
