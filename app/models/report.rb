class Report < ApplicationRecord
    belongs_to :chatroom
    
    validates :title, presence: true, length: { in: 3..30 }
    validates :content, presence: true
    validates :username, presence: true
    validates :chatroom, presence: true
end
