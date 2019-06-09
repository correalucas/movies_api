require 'rails_helper'

RSpec.describe Library, type: :model do
  subject { create(:library, alive: true) }

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:option) }
    it { is_expected.to have_one(:catalogue) }
  end

  context 'validations' do
    describe 'unique movie/season alive at time' do
      it { expect { subject.dup.save! }.to raise_error(ActiveRecord::RecordInvalid) }
    end
  end
end
