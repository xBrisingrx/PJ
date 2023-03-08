class City < ApplicationRecord
  belongs_to :province
  
  validates :name, presence: true, 
    uniqueness: { case_sensitive: false, message: "Ya existe una ciudad registrada con este nombre" }
  scope :actives, -> { where(active: true) }
end
