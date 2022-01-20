class Category < ApplicationRecord
    validates :category, presence: true, uniqueness: true
    validates :color, presence: true, format: { with: /\A#([a-fA-F0-9]{6})$\z/ }
end
