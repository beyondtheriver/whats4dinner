require 'unirest'
class RecipesController < ApplicationController


  def index

  end

  def create
    @recipe = Recipe.create(recipe_params)
  end

  def destroy
  end


  def show

    ingredientssearch = params[:ingredients].join(",")

  #first call to API get a list of recipes we need to display
   @response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?ingredients="+ ingredientssearch +"&limitLicense=true&number=10&ranking=1",
    headers:{
     "X-Mashape-Key" => "PRyzsssDGXmshrmnhnFD9DSY98YUp1ORXtjjsnlRaiF6hxwMKa",
     "Accept" => "application/json"
    }
    cookies[:list_of_recipes] = JSON.generate(@response.body)
    @cookiesstring = cookies[:list_of_recipes]
    @cookievalue = JSON.parse(@cookiesstring)



   # @recipe = Recipe.find(params[:id])



  end

  def individual_recipe

     @resp = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/" + params[:id].to_s + "/information?includeNutrition=false",
     headers:{
     "X-Mashape-Key" => "PRyzsssDGXmshrmnhnFD9DSY98YUp1ORXtjjsnlRaiF6hxwMKa"
     }

     @cookievalue = JSON.parse(cookies[:list_of_recipes])
     @cookievalue.each do |key|
        if key["id"] == params[:id].to_i
          @title = key["title"]
          @image = key["image"]
        end
      end


  end

private

  def recipe_params
    params.require(:recipe).permit(:api_id, :title, :image, :vegetarian, :vegan, :gluten_free, :dairy_free, :instructions)
  end



end
