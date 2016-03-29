require 'unirest'
class RecipesController < ApplicationController


  def index



  end

  def show

    ingredientssearch = params[:ingredients].join(",")

     #first call to API get a list of recipes we need to display
   @response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?ingredients="+ ingredientssearch +"&limitLicense=true&number=10&ranking=1",
    headers:{
     "X-Mashape-Key" => "PRyzsssDGXmshrmnhnFD9DSY98YUp1ORXtjjsnlRaiF6hxwMKa",
     "Accept" => "application/json"
    }

    
  end

  def individual_recipe

     @resp = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/" + params[:id].to_s + "/information?includeNutrition=false",
     headers:{
     "X-Mashape-Key" => "PRyzsssDGXmshrmnhnFD9DSY98YUp1ORXtjjsnlRaiF6hxwMKa"
     }


  end

  # def ingredient_search
  #  puts params
  #  @ingredients = params[:ingredients]
  #  redirect_to '/recipes/show', ingredients: params[:ingredients]
  # end
end
