class ChangeLibrary < ActiveRecord::Migration[5.2]
  def change
    change_column_default :libraries, :public, nil
  end
end
