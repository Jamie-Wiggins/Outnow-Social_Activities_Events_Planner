class ChatroomUser < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :user, presence: true
  validates :chatroom, presence: true
  validates :hidden_name, presence: true, length: { in: 3..30 }
end
