require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    before do
      get :index
    end

    it 'returns the correct status' do
      expect(response.status).to eq(200)
    end

    it 'returns the correct response' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to eq({ "api" => "ok" })
    end
  end

  describe "POST #create" do
    context 'when user has valid params' do
      let(:user_params) { FactoryGirl.attributes_for(:user) }

      before do
        post :create, params: { user: user_params }
      end

      it 'returns the correct status' do
        expect(response).to be_successful
      end

      it 'returns the correct response' do
        expect(response.body).to eq({ user: User.first }.to_json)
      end
    end
  end
end
