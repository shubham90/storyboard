require 'rails_helper'

RSpec.describe Story, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:developers) }
    it { is_expected.to have_many(:developer_stories) }

    it { is_expected.to belong_to(:project) }
    it { is_expected.to belong_to(:signup_user) }  
  end

  describe "Validation" do
    it { is_expected.to validate_presence_of(:name) }
  end

end