require 'unirest'
class RecipesController < ApplicationController


  def index

   if !params[:ingredients].nil?
     ingredientssearch = params[:ingredients].join(",")

     #first call to API get a list of recipes we need to display
   @response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?ingredients="+ ingredientssearch +"&limitLicense=true&number=10&ranking=1",
    headers:{
     "X-Mashape-Key" => "PRyzsssDGXmshrmnhnFD9DSY98YUp1ORXtjjsnlRaiF6hxwMKa",
     "Accept" => "application/json"
    }

    @ids = []
    @titles = []
    @images = []


  @response.body.each do |key|
   @ids.push(key["id"])
   @titles.push(key["title"])
   @images.push(key["image"])
  end

   #second call to API to get directions for the recipe the user selects, need to pass id number

     @resp = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/" + @ids[0].to_s + "/information?includeNutrition=false",
     headers:{
     "X-Mashape-Key" => "PRyzsssDGXmshrmnhnFD9DSY98YUp1ORXtjjsnlRaiF6hxwMKa"
     }


   @instructs = "";


      @instructs = @resp.body["instructions"]
   else

      @instructs = 'ingredients were nil!'
      end





  end


  def ingredient_search
   puts params
   @ingredients = params[:ingredients]
   redirect_to '/', ingredients: params[:ingredients]
  end
end
