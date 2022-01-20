class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  encrypts :body
  blind_index :body

  validates :chatroom, presence: true
  validates :user, presence: true
  validates :sender, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :body, presence: true
  validates :hidden_name, presence: true
end
