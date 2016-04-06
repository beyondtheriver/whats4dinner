class AddInfoToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :usedIngredientCount, :integer
    add_column :recipes, :missedIngredientCount, :integer
    add_column :recipes, :readyInMinutes, :integer
  end
end
