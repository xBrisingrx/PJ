class InstitutionType < ApplicationRecord
	has_many :institutions

	validates :name, presence: true, 
    uniqueness: { case_sensitive: false, message: "Ya existe un tipo de institución registrada con este nombre" }
  scope :actives, -> { where(active: true) }
end
