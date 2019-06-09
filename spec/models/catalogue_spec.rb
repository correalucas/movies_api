require 'rails_helper'

RSpec.describe Catalogue, type: :model do
  subject { create(:catalogue) }

  context 'associations' do
    it { is_expected.to have_many(:options) }
    it { is_expected.to have_many(:episodes) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_inclusion_of(:category).in_array(%w[movie season]) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:plot) }
  end
end
