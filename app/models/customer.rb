class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :reports, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :favorites,dependent: :destroy
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :email, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
end
