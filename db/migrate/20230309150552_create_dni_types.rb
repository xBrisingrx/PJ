class CreateDniTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :dni_types do |t|
      t.string :name, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
