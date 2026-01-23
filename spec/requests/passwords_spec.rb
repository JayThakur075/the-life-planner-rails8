require "rails_helper"

RSpec.describe "Passwords", type: :request do
  let(:user) { create(:user) }

  describe "GET /password/new" do
    it "renders the password reset request page" do
      get new_password_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /passwords" do
    before do
      ActiveJob::Base.queue_adapter = :test
    end

    it "sends reset instructions if user exists" do
      expect {
        post passwords_path, params: {
          email_address: user.email_address
        }
      }.to have_enqueued_job(ActionMailer::MailDeliveryJob)
    end

    it "does not reveal if email does not exist" do
      post passwords_path, params: {
        email_address: "unknown@example.com"
      }

      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "GET /password/:token/edit" do
    it "allows access with valid token" do
      get edit_password_path(user.password_reset_token)
      expect(response).to have_http_status(:ok)
    end

    it "redirects with invalid token" do
      get edit_password_path("invalid-token")

      expect(response).to redirect_to(new_password_path)
      expect(flash[:alert]).to be_present
    end
  end

  describe "PATCH /password/:token" do
    it "resets password with valid data" do
      patch password_path(token: user.password_reset_token), params: {
        password: "newpassword123",
        password_confirmation: "newpassword123"
      }

      expect(response).to redirect_to(new_session_path)

      # Verify password was actually changed
      expect(
        User.authenticate_by(
          email_address: user.email_address,
          password: "newpassword123"
        )
      ).to eq(user)
    end

    it "rejects mismatched passwords" do
      patch password_path(token: user.password_reset_token), params: {
        password: "one",
        password_confirmation: "two"
      }

      expect(response).to have_http_status(:redirect)
      expect(flash[:alert]).to eq("Passwords did not match.")
    end
  end
end
