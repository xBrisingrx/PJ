class AddInstitutionTypeToInstitutions < ActiveRecord::Migration[5.2]
  def change
    add_reference :institutions, :institution_type, foreign_key: true
  end
end
