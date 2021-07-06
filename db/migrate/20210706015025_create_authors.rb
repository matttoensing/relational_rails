class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.boolean :published, default: true
      t.integer :age
      t.timestamps
    end
  end
end
