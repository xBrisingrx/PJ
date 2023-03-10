class Institution < ApplicationRecord
	belongs_to :institution_type
	belongs_to :neighborhood
	has_one :city, through: :neighborhood
	has_many :tables
	validates :name, presence: true, 
    uniqueness: { case_sensitive: false, message: "Ya existe una institución registrada con este nombre" }
  scope :actives, -> { where(active: true) }
end
