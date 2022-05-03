class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :reports, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
end
