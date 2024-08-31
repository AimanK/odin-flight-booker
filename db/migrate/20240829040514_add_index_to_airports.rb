class AddIndexToAirports < ActiveRecord::Migration[7.2]
  def change
    add_index :airports, :code, unique: true
    change_column_null :airports, :code, false
  end
end
