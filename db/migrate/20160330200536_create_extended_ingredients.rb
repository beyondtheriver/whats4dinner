class CreateExtendedIngredients < ActiveRecord::Migration
  def change
    create_table :extended_ingredients do |t|
      t.text :original_string
      t.string :name

      t.timestamps null: false
    end
  end
end
