class DropMonsterRecipe < ActiveRecord::Migration[6.1]
  def change
    drop_table :monster_recipes
  end
end
