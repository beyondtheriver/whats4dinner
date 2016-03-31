class AddRecipeIdToExtendedIngredients < ActiveRecord::Migration
  def change
    add_column :extended_ingredients, :recipe_id, :integer
  end
end
