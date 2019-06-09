require 'rails_helper'

RSpec.describe Episode, type: :model do
  subject { create(:episode) }

  context 'associations' do
    it { is_expected.to belong_to(:catalogue) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:number).scoped_to(:catalogue_id) }
  end
end
