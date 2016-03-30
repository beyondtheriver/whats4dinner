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

    cookies[:list_of_recipes] = JSON.generate(@response.body)
   
   @cookiesstring = cookies[:list_of_recipes]

    @cookievalue = JSON.parse(@cookiesstring)

    puts @cookievalue[1]["title"]
   
    # puts JSON.parse(cookies[:list_of_recipes].to_s)
    puts @cookievalue

    
    
    
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

  def shared_info
    show 

    @title = @response.body.title

  end

  # def ingredient_search
  #  puts params
  #  @ingredients = params[:ingredients]
  #  redirect_to '/recipes/show', ingredients: params[:ingredients]
  # end
end
