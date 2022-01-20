class Post < ApplicationRecord
    mount_uploader :image, ImageUploader

    validates :title, presence: true, length: { in: 3..30 }
    validates :content, presence: true
end
