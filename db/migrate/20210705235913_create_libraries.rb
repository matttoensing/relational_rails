class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.boolean :public
      t.integer :zip_code

      t.timestamps
    end
  end
end
