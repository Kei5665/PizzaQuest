class CreateRecipeGrams < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_grams do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :gram, null: false, foreign_key: true

      t.timestamps
    end
  end
end
