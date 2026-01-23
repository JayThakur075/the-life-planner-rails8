require "rails_helper"

RSpec.describe TaskArchiverJob, type: :job do
  let(:group) { create(:group) }

  it "archives completed tasks" do
    completed_task = create(:task, group: group, status: "completed")
    in_progress_task = create(:task, group: group, status: "in_progress")

    described_class.perform_now

    expect(completed_task.reload.status).to eq("archived")
    expect(in_progress_task.reload.status).to eq("in_progress")
  end

  it "enqueues the job" do
    expect {
      TaskArchiverJob.perform_later
    }.to have_enqueued_job(TaskArchiverJob)
  end
end
