class AdminUser < ApplicationRecord
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :password, presence: true, length: { in: 3..30 }
  
end
