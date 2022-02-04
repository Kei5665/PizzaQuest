class CreateGrams < ActiveRecord::Migration[6.1]
  def change
    create_table :grams do |t|
      t.string :gram,null: false

      t.timestamps
    end
  end
end
