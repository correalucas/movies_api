require 'rails_helper'

RSpec.describe 'Options API', type: :request do
  let(:user) { create(:user) }
  let(:option) { create(:option) }

  describe 'POST /v1/purchase' do
    let(:valid_attributes) { { user_id: user.id, option_id: option.id } }

    context 'when the request is valid' do
      before { post '/v1/purchase', params: valid_attributes }

      it 'creates a option' do
        expect(json['message']).to eq("Movie/season successfully purchased")
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/v1/purchase', params: { user_id: user.id, option_id: nil } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['errors'])
          .to eq(["Option must exist"])
      end
    end
  end
end
