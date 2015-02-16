require 'rails_helper'

describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:stories) }
    it { is_expected.to have_many(:developer_stories) }

    it { is_expected.to belong_to(:project) }
  end
end
