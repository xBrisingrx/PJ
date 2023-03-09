class Person < ApplicationRecord
  belongs_to :neighborhood
  belongs_to :dni_type

  validates :name, :last_name, :number, presence: true
  validates :number, uniqueness: { message: "Esta matrícula ya se encuentra registrada" }
  
  enum genre: [:X,:M, :F]

  def fullname
    "#{self.last_name} #{self.name}"
  end
end
