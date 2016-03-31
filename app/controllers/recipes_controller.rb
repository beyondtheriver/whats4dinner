require 'unirest'
class RecipesController < ApplicationController

  def index
    if current_user
      @profile = current_user.profile
    else
    end

  end

  def create
    # @recipe = Recipe.create(recipe_params)
  end

  def destroy
  end


  def show

    ingredientssearch = params[:ingredients].join(",")

     cookies[:list_of_recipes] = new_API_first_call(ingredientssearch)

    # @recipe = Recipe.find(params[:id])


    # render partial: 'recipes/show'

    respond_to do |format|
      format.js
    end
  end

  def individual_recipe
    # the params[:id] here is actually the API id 6 digit
    if (Recipe.where("api_id = ?", params[:id]) == true)


      @recipe = Recipe.where(api_id: params[:id]).take
      @image = @recipe.image
      @title = @recipe.title
      @extended_ing = ExtendedIngredient.where(:recipe_id => @recipe.id).take

    else

      @resp = second_API_call_one_recipe(params[:id].to_s)
       @cookievalue = JSON.parse(cookies[:list_of_recipes])

       @cookievalue.each do |key|
          if key["id"] == params[:id].to_i
            @id = key["id"]
            @title = key["title"]
            @image = key["image"]
          end
        end

        @recipe = Recipe.create(:api_id => @id, :title => @title, :image => @image, :vegetarian => @resp.body['vegetarian'], :vegan => @resp.body['vegan'], :gluten_free => @resp.body['glutenFree'], :dairy_free => @resp.body['dairyFree'], :instructions => @resp.body['instructions'])

        @extended_ing = []
        @resp.body["extendedIngredients"].each do |key|
           x = ExtendedIngredient.create(:original_string =>  key["originalString"] , :name => key["name"], :recipe_id => @recipe.id)
           @extended_ing.push(x)

           @ingredient = Ingredient.create(:name => key["name"])
           RecipeIngredient.create(recipe_id: @recipe.id, ingredient_id: @ingredient.id)
         end

         #favorite recipe



    end



  end

  def favorite
    @userrecipe = UserRecipe.create(user_id: current_user.id, recipe_id: params[:recipe_id])

    # render nothing: true

    respond_to do |format|
      format.js
    end
  end


  def new_API_first_call(ingredientssearch)
   #first call to API get a list of recipes we need to display
   @response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?ingredients="+ ingredientssearch +"&limitLicense=true&number=12&ranking=1",
    headers:{
     "X-Mashape-Key" => "PRyzsssDGXmshrmnhnFD9DSY98YUp1ORXtjjsnlRaiF6hxwMKa",
     "Accept" => "application/json"
    }


    JSON.generate(@response.body)
  end

  def second_API_call_one_recipe(id)
    resp = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/" + id + "/information?includeNutrition=false",
     headers:{
     "X-Mashape-Key" => "PRyzsssDGXmshrmnhnFD9DSY98YUp1ORXtjjsnlRaiF6hxwMKa"
     }
     resp


  end



private

  def recipe_params
    params.require(:recipe).permit(:api_id, :title, :image, :vegetarian, :vegan, :gluten_free, :dairy_free, :instructions)
  end



end
