require "rails_helper"

RSpec.describe "Factory sanity check" do
  it "creates a valid group" do
    expect(build(:group)).to be_valid
  end

  it "creates a valid user" do
    expect(build(:user)).to be_valid
  end

  it "creates a valid task" do
    expect(build(:task)).to be_valid
  end

  it "creates a completed task" do
    expect(build(:task, :completed)).to be_valid
  end

  it "creates a message" do
    expect(build(:message)).to be_valid
  end

  it "creates a session" do
    expect(build(:session)).to be_valid
  end
end
