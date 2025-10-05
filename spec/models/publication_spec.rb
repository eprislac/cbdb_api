require 'rails_helper'

RSpec.describe Publication, type: :model do
  it { should have_many(:issues).dependent(:destroy) }
  it { should belong_to(:publication_type) }
  it { should validate_presence_of(:title) }
  let!(:publisher) { Publisher.create(name: "Test Publisher") }
  let!(:publication_type) { PublicationType.create(name: "Test Type") }
  subject { Publication.new(title: "Test Publication", publisher: publisher, publication_type: publication_type) }
  it { should validate_uniqueness_of(:title) }
end
