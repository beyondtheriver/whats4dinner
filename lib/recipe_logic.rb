module RecipeLogic


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

end
