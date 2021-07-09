class UpdateLibrary < ActiveRecord::Migration[5.2]
  def change
    change_column_default :libraries, :public, default: true, null: false
  end
end
