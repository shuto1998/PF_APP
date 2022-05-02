class Corporate < ApplicationRecord
  has_many :reports, dependent: :destroy
  def self.search(search)
    search ? where('title LIKE ?', "%#{search}%") : all
  end
end
