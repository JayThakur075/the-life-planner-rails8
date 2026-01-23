require "rails_helper"

RSpec.describe Message, type: :model do
  it "has a valid factory" do
    expect(build(:message)).to be_valid
  end

  it "belongs to a user" do
    message = build(:message)
    expect(message.user).to be_present
  end

  it "belongs to a task" do
    message = build(:message)
    expect(message.task).to be_present
  end
end
