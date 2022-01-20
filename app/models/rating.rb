class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :rating, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :user, presence: true
  validates :chatroom, presence: true
  validates :rating_for, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
