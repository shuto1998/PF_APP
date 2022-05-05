class Report < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :corporate
  belongs_to :customer
  
  validates :report_text, presence: true
  validates :result, presence: true
  validates :next, presence: true

end
