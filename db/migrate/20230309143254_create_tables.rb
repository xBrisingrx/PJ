class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :number
      t.boolean :active, default: true
      t.references :institution, foreign_key: true
      t.timestamps
    end
  end
end
