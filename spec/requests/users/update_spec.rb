require 'rails_helper'

describe 'Update user mutation request', type: :request do
  subject(:request) do
    graphql_request(request_body, variables: request_variables, headers: auth_headers)
  end

  let!(:user) { create(:user) }
  let(:email) { 'obikenobi@rebel.com' }
  let(:password) { 'abcd1234' }
  let(:request_body) do
    <<~GQL
      mutation UpdateUser(
        $email: String,
        $password: String
      ) {
        updateUser(input: {
          email: $email,
          password: $password
        }) {
          user {
            id
            email
          }
        }
      }
    GQL
  end
  let(:request_variables) do
    {
      email: email,
      password: password
    }
  end
  let(:response_content) { json.dig(:data, :updateUser) }

  context 'with valid params' do
    let(:updated_user) { user.reload }

    specify do
      request

      expect(errors).to be_nil
    end

    specify do
      request

      expect(response).to have_http_status(:ok)
    end

    it 'returns the user data' do
      request

      expect(response_content[:user]).to include_json(
        id: updated_user.id.to_s,
        email: updated_user.email
      )
    end
  end

  context 'with invalid params' do
    context 'when the email is missing' do
      let(:email) { '' }

      it 'returns an error message' do
        request

        expect(first_error_message).not_to be_nil
      end

      it 'does not update current user' do
        expect {
          request
        }.not_to change(user.reload, :email)
      end
    end

    context 'when the email is taken' do
      before { create(:user, email: email) }

      it 'returns an error message' do
        request

        expect(first_error_message).not_to be_nil
      end

      it 'does not update current user' do
        expect {
          request
        }.not_to change(user.reload, :email)
      end
    end
  end
end
