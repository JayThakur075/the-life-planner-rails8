class Message < ApplicationRecord
  belongs_to :user
  belongs_to :task

  after_create_commit :notify_task

  def notify_task
    broadcast_append_to(
      [ task, "messages" ],
      target: "messages",
      partial: "messages/message",
      locals: { message: self }
    )
  end
end
