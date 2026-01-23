require "rails_helper"

RSpec.describe Task, type: :model do
  it "has a valid factory" do
    expect(build(:task)).to be_valid
  end

  it "belongs to a group" do
    task = build(:task)
    expect(task.group).to be_present
  end

  it "defaults to in_progress status" do
    task = create(:task)
    expect(task.status).to eq("in_progress")
  end

  it "can be completed" do
    task = create(:task, :completed)
    expect(task.status).to eq("completed")
  end

  it "can be archived" do
    task = create(:task, :archived)
    expect(task.status).to eq("archived")
  end
end
