class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients, dependent: :destroy
	has_many :ingredients, through: :recipe_ingredients
	has_many :user_recipes
	has_many :users, through: :user_recipes
	has_many :extended_ingredients, dependent: :destroy
end
