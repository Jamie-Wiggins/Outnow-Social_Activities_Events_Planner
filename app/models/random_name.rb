class RandomName < ApplicationRecord
    validates :username, presence: true, length: { in: 3..30 }
end
