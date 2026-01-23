require "rails_helper"

RSpec.describe User, type: :model do
  subject { build(:user) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end

  it "is invalid without email_address" do
    subject.email_address = nil
    expect(subject).not_to be_valid
  end

  it "enforces unique email_address" do
    create(:user, email_address: "test@example.com")
    user = build(:user, email_address: "test@example.com")

    expect(user).not_to be_valid
  end

  it "belongs to a group" do
    expect(subject.group).to be_present
  end

  it "can have multiple sessions" do
    user = create(:user)
    create_list(:session, 2, user: user)

    expect(user.sessions.count).to eq(2)
  end
end
