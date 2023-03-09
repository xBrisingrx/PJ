class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.integer :genre
      t.string :dni
      t.integer :number, null: false
      t.string :direction
      t.boolean :active, default: true
      t.references :neighborhood, foreign_key: true

      t.timestamps
    end
  end
end
