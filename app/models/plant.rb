class Plant < ApplicationRecord
  belongs_to :garden

  validates :name, presence: true
  validates :species, presence: true
  validates :image_url, presence: true
  validates :garden, presence: true
end
