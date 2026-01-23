require "rails_helper"

RSpec.describe "Messages", type: :request do
  let(:group) { create(:group) }
  let(:user)  { create(:user, group: group) }
  let(:task)  { create(:task, group: group) }

  before do
    sign_in_as(user)
  end

  describe "POST /tasks/:task_id/messages" do
    it "creates a message for the task" do
      expect {
        post task_messages_path(task), params: {
          message: {
            content: "Hello world"
          }
        }
      }.to change(Message, :count).by(1)

      message = Message.last

      expect(message.content).to eq("Hello world")
      expect(message.task).to eq(task)
      expect(message.user).to eq(user)
    end

    it "returns 204 no content" do
      post task_messages_path(task), params: {
        message: { content: "Test" }
      }

      expect(response).to have_http_status(:no_content)
      expect(response.body).to be_blank
    end
  end
end
