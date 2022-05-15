class Report < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :corporate
  belongs_to :customer
  has_many :favorites,dependent: :destroy

   def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
   end

  validates :report_text, presence: true
  validates :result, presence: true
end
