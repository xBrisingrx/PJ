class Institution < ApplicationRecord
	belongs_to :institution_type

	validates :name, presence: true, 
    uniqueness: { case_sensitive: false, message: "Ya existe una institución registrada con este nombre" }
  scope :actives, -> { where(active: true) }
end
