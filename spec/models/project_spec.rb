require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:stories).dependent(:destroy) }
    it { is_expected.to have_many(:users) }
  end

  describe "Validation" do
    it { is_expected.to validate_presence_of(:name) }
  end

end
