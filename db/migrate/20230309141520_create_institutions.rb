class CreateInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :institutions do |t|
      t.string :name, null: false
      t.text :description
      t.integer :d_type
      t.string :direction
      t.boolean :active, default: true
      t.references :neighborhood, foreign_key: true
      t.timestamps
    end
  end
end
