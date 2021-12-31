class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name,null: false
      t.string :gram,null: false

      t.timestamps
    end
  end
end
