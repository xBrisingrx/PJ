class AddDniTypeToPeople < ActiveRecord::Migration[5.2]
  def change
    add_reference :people, :dni_type, foreign_key: true
  end
end
