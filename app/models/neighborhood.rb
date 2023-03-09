class Neighborhood < ApplicationRecord
  belongs_to :city
  has_many :tables

  validates :name, presence: true, 
    uniqueness: { case_sensitive: false, message: "Ya existe un barrio registrada con este nombre" }
  scope :actives, -> { where(active: true) }
end
