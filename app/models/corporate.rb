class Corporate < ApplicationRecord
  has_many :reports, dependent: :destroy
end
