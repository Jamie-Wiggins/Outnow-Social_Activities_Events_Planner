class Chatroom < ApplicationRecord
    has_many :chatroom_users, dependent: :destroy
    has_many :users, through: :chatroom_users
    has_many :messages, dependent: :destroy
    has_many :reports, dependent: :destroy
    belongs_to :activity

    has_many :ratings, dependent: :destroy

    validates :name, presence: true, length: { in: 3..30 }
    validates :activity, presence: true
end
