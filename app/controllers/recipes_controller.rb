require 'unirest'
class RecipesController < ApplicationController
  include RecipeLogic

  def index
    if current_user
      @profile = current_user.profile
    else
    end

  end

  def create
   
  end

  def destroy
  end


  def show

    ingredientssearch = params[:ingredients].join(",")

     cookies[:list_of_recipes] = new_API_first_call(ingredientssearch)

    respond_to do |format|
      format.js
      format.html
    end
  end

  def individual_recipe
    # the params[:id] here is actually the API id 6 digit

    if (Recipe.where("api_id = ?", params[:id]).first)

      @recipe = Recipe.where(api_id: params[:id]).take
      @extended_ing = ExtendedIngredient.where(:recipe_id => @recipe.id)

    else
    
        @recipe = building_recipe
      

        
         @resp = second_API_call_one_recipe(params[:id].to_s)
        
        @extended_ing = []
        @resp.body["extendedIngredients"].each do |key|
           x = ExtendedIngredient.create(:original_string =>  key["originalString"] , :name => key["name"], :recipe_id => @recipe.id)
          
           @extended_ing.push(x)

           @ingredient = Ingredient.create(:name => key["name"])
           RecipeIngredient.create(recipe_id: @recipe.id, ingredient_id: @ingredient.id)
         end

         #favorite recipe
         @favorited = UserRecipe.find_by(user_id: current_user.id, recipe_id: @recipe.id).present?



    end



  end

  def favorite
     @recipe = Recipe.where(id: params[:recipe_id]).first
      @user = current_user

      # @recipe = Recipe.where(recipe_id: params[:id]).first
      @userrecipe = UserRecipe.create(user_id: current_user.id, recipe_id: params[:recipe_id])

    # render nothing: true

    respond_to do |format|
      format.js
    end
  end

  def unfavorite
    @user = current_user
    @recipe = Recipe.where(id: params[:recipe_id]).first

    @userrecipe = UserRecipe.where(user_id: current_user.id, recipe_id: params[:recipe_id]).first

    if @userrecipe
        @userrecipe.destroy
    end

     respond_to do |format|
        format.js
     end

  end

end
