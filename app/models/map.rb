class Map < ApplicationRecord

  enum course: { beginner: 0, intermediate: 1, advanced: 2 }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
end
