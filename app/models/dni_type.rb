class DniType < ApplicationRecord
	has_many :poeple

  validates :name, presence: true, 
    uniqueness: { case_sensitive: false, message: "Ya existe un tipo de dni con este nombre" }
  scope :actives, -> { where(active: true) }
end
