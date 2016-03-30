class AddColumnsToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :api_id, :integer
    add_column :recipes, :title, :string
    add_column :recipes, :image, :text
    add_column :recipes, :vegetarian, :boolean
    add_column :recipes, :vegan, :boolean
    add_column :recipes, :gluten_free, :boolean
    add_column :recipes, :dairy_free, :boolean
  end
end
