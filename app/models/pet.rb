class Pet < ApplicationRecord
  validates_presence_of(:image, :name, :approximate_age, :sex, :shelter_id)

  belongs_to :shelter
end
