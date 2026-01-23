require "rails_helper"

RSpec.describe Session, type: :model do
  it "has a valid factory" do
    expect(build(:session)).to be_valid
  end

  it "belongs to a user" do
    session = build(:session)
    expect(session.user).to be_present
  end
end
