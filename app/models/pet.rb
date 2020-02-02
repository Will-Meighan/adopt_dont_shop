class Pet < ApplicationRecord
  validates_presence_of(:image, :name, :approximate_age, :sex, :shelter_id, :description, :status)

  belongs_to :shelter
end
