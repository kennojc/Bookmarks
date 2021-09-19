class Bookmark < ApplicationRecord
  validates :address, presence: true
  belongs_to :category
  belongs_to :type

end
