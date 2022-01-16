class AddOrderNumToMonsterRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :monster_recipes, :order_num, :integer
  end
end
