class AddNullFalseToMonsters < ActiveRecord::Migration[6.1]
  def change
    change_column_null :monsters, :name, false
    change_column_null :monsters, :level, false
    change_column_null :monsters, :detail, false
  end
end
