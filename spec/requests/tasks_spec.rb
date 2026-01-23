require "rails_helper"

RSpec.describe "Tasks", type: :request do
  let(:group) { create(:group) }
  let(:user)  { create(:user, group: group) }

  before do
    sign_in_as(user)
  end

  describe "POST /tasks" do
    it "creates a task" do
      expect {
        post tasks_path, params: {
          task: {
            name: "New Task",
            description: "Test task",
            status: "in_progress",
            group_id: group.id
          }
        }
      }.to change(Task, :count).by(1)
    end
  end

  describe "PATCH /tasks/:id" do
    it "updates task status" do
      task = create(:task, group: group)

      patch task_path(task), params: {
        task: { status: "completed" }
      }

      expect(task.reload.status).to eq("completed")
    end
  end
end
