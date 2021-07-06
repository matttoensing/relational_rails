class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.boolean :late_fees, default: false
      t.references :library, foreign_key: true

      t.timestamps
    end
  end
end
