require 'rails_helper'

RSpec.describe PublicationType, type: :model do
  it { should have_many(:publications).dependent(:nullify) }
  it { should validate_presence_of(:name) }
end
