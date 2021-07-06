class CreateMuseums < ActiveRecord::Migration[5.2]
  def change
    create_table :museums do |t|
      t.string :name
      t.boolean :free, default: false
      t.integer :entry_fee
      t.timestamps
    end
  end
end
