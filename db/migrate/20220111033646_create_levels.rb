class CreateLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :levels do |t|
      t.string :level_name,null: false
      t.integer :required_gold,nall: false

      t.timestamps
    end
  end
end
