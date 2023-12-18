class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.references :doctor, null: false, foreign_key: true
      t.integer :capacity

      t.timestamps
    end
  end
end
