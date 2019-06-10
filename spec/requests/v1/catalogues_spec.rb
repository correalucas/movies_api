require 'rails_helper'

RSpec.describe 'Catalogues API', type: :request do
  let(:user) { create(:user) }
  let!(:catalogues) { create_list(:catalogue, 2, category: 'movie') }
  let!(:movies) { create_list(:movie, 2) }
  let!(:seasons) { create_list(:season, 2) }

  describe 'GET /v1/catalogues' do
    before { get '/v1/catalogues', params: { user_id: user_id } }

    context 'authenticated user' do
      let(:user_id) { user.id }

      it 'returns catalogues' do
        expect(json).not_to be_empty
        expect(json['data'].size).to eq(6)
      end

      it { expect(response).to be_successful }
    end

    context 'unauthenticated' do
      let(:user_id) { nil }
      it { expect(response).to be_unauthorized }
    end
  end

  describe 'GET /v1/movies' do
    before { get '/v1/movies', params: { user_id: user_id } }

    context 'authenticated user' do
      let(:user_id) { user.id }

      it 'returns movies' do
        expect(json).not_to be_empty
        expect(json['data'].size).to eq(4)
      end

      it { expect(response).to be_successful }
    end

    context 'unauthenticated' do
      let(:user_id) { nil }
      it { expect(response).to be_unauthorized }
    end
  end

  describe 'GET /v1/seasons' do
    before { get '/v1/seasons', params: { user_id: user_id } }

    context 'authenticated user' do
      let(:user_id) { user.id }

      it 'returns seasons' do
        expect(json).not_to be_empty
        expect(json['data'].size).to eq(2)
      end

      it { expect(response).to be_successful }
    end

    context 'unauthenticated' do
      let(:user_id) { nil }
      it { expect(response).to be_unauthorized }
    end
  end
end
