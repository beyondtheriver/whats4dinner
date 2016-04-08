module RecipeLogic


def new_API_first_call(ingredientssearch)
   #first call to API get a list of recipes we need to display
   @response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?ingredients="+ ingredientssearch +"&limitLicense=true&number=12&ranking=1",
    headers:{
     "X-Mashape-Key" => ENV["SPOONACULAR_KEY"],
     "Accept" => "application/json"
    }


    JSON.generate(@response.body)
  end

  def second_API_call_one_recipe(id)
    resp = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/" + id + "/information?includeNutrition=false",
     headers:{
     "X-Mashape-Key" => ENV["SPOONACULAR_KEY"]
     }
     resp
  end

  def building_recipe
      @resp = second_API_call_one_recipe(params[:id].to_s)
       @cookievalue = JSON.parse(cookies[:list_of_recipes])

       @cookievalue.each do |key|
          if key["id"] == params[:id].to_i
            @id = key["id"]
            @title = key["title"]
            @image = key["image"]
            @missedIng = key['missedIngredientCount']
            @includedIng = key['usedIngredientCount']
          end
        end
        @recipe = Recipe.create(:api_id => @id, :title => @title, :image => @image, :vegetarian => @resp.body['vegetarian'], :vegan => @resp.body['vegan'], :gluten_free => @resp.body['glutenFree'], :dairy_free => @resp.body['dairyFree'], :instructions => @resp.body['instructions'], :usedIngredientCount => @includedIng, :missedIngredientCount => @missedIng, :readyInMinutes => @resp.body['readyInMinutes'])



  end

end
