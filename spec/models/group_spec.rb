require "rails_helper"

RSpec.describe Group, type: :model do
  it "has a valid factory" do
    expect(build(:group)).to be_valid
  end

  it "can have many users" do
    group = create(:group)
    create_list(:user, 2, group: group)

    expect(group.users.count).to eq(2)
  end

  it "can have many tasks" do
    group = create(:group)
    create_list(:task, 3, group: group)

    expect(group.tasks.count).to eq(3)
  end
end
