class Report < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :corporate
  belongs_to :customer
end
