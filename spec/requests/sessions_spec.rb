require "rails_helper"

RSpec.describe "Sessions", type: :request do
  let(:user) { create(:user) }

  describe "POST /session" do
    it "logs in with valid credentials" do
      post session_path, params: {
        email_address: user.email_address,
        password: "password123"
      }

      expect(response).to redirect_to(root_path)
       expect(response.cookies["session_id"]).to be_present
    end

    it "rejects invalid credentials" do
      post session_path, params: {
        email_address: user.email_address,
        password: "wrong"
      }

      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "DELETE /session" do
    it "logs out the user" do
      sign_in_as(user)

      delete session_path

      expect(response.cookies["session_id"]).to be_nil
    end
  end
end
