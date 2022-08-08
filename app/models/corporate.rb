class Corporate < ApplicationRecord
  has_many :reports, dependent: :destroy

  validates :name, presence: true
  validates :name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :annual_saleses, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :employees, presence: true
  validates :bases, presence: true

end
