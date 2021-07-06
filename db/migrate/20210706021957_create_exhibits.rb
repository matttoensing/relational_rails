class CreateExhibits < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibits do |t|
      t.string :title
      t.integer :person_limit
      t.boolean :photos, default: false
      t.boolean :flash, default: false
      t.references :museum, foreign_key: true
      t.timestamps
    end
  end
end
