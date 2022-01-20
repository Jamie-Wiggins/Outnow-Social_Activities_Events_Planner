class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chatroom_users, dependent: :destroy
  has_many :chatrooms, through: :chatroom_users
  has_many :messages, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :ratings, dependent: :destroy

  mount_uploader :avatar, ImageUploader

  # email regex is inbuilt rails regex
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # username regex: word of a-z, A-Z, 0-9 and _ no spaces, length from 3 to 30 characters inclusive
  validates :username, presence: true, uniqueness: true, format: { with: /\A([a-zA-Z0-9_]{3,31})\Z/ }
  validates :first_name, presence: true, length: { in: 3..30 }
  validates :last_name, presence: true, length: { in: 3..30 }
  #validates :password, presence: true, length: { in: 8..30 }
  #validates :card_exp_month, format: { with: /\A(([0-9]{2})?)\Z/ }
  #validates :card_exp_year, format: { with: /\A(([0-9]{4})?)\Z/ }
  #validates :card_last4, format: { with: /\A(([0-9]{4})?)\Z/ }
  # validates :avatar, presence: true
  # validates_presence_of   :avatar
  # validates_integrity_of  :avatar
  # validates_processing_of :avatar
end
