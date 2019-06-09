require 'rails_helper'

RSpec.describe Option, type: :model do
  subject { create(:option) }

  context 'associations' do
    it { is_expected.to belong_to(:catalogue) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:expiration) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0.0) }
  end
end
