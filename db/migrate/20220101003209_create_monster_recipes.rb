class CreateMonsterRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :monster_recipes do |t|
      t.references :monster, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
