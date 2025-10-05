require 'rails_helper'

RSpec.describe Creator, type: :model do
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:first_name) }
  it { should validate_uniqueness_of(:last_name).scoped_to(:first_name) }
end
