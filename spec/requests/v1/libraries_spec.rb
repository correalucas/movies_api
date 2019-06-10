require 'rails_helper'

RSpec.describe 'Libraries API', type: :request do
  let(:user) { create(:user) }
  let!(:library_alive) { create_list(:library_alive, 3, user_id: user.id) }

  describe 'GET /v1/libraries' do
    before { get '/v1/libraries', params: { user_id: user_id } }

    context 'authenticated user' do
      let(:user_id) { user.id }

      it 'returns libraries' do
        expect(json).not_to be_empty
        expect(json.size).to eq(3)
      end

      it { expect(response).to be_successful }
    end

    context 'unauthenticated' do
      let(:user_id) { nil }
      it { expect(response).to be_unauthorized }
    end
  end
end
