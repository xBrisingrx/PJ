class Province < ApplicationRecord
	has_many :cities
	
	validates :name, presence: true, 
		uniqueness: { case_sensitive: false, message: "Ya existe una provincia registrada con este nombre" }
	scope :actives, -> { where(active: true) }
end
