class RecipesController < ApplicationController
  def index
    @courses=Course.all
    @cuisines=Cuisine.all

    render({ :template => "recipes/index" })
  end

  def create
    the_recipe = Recipe.new
    the_recipe.user_id = current_user.id
    the_recipe.dish = params.fetch("dish")
    the_recipe.course = params.fetch("course","")
    the_recipe.cuisine = params.fetch("cuisine","")
    the_recipe.notes = params.fetch("notes","")

    prompt_text = "Generate a recipe as a JSON object matching our function schema. 
    Dish: #{the_recipe.dish}
    Cuisine: #{the_recipe.cuisine}
    Course (recipeCategory): #{the_recipe.course}
    Expertise level: #{current_user.expertise}
    Dietary preferences (keywords): #{current_user.diet_preferences}
    Allergies (keywords): #{current_user.allergies}

    For each step of the instruction, mention how much time they need to do that step for.

    Based on the macronutrients of this recipe and the user's profile, suggest 2 or 3 next meals optimized for balanced nutrition. The JSON must include exactly these fields:
    - recipeIngredient: an array of ingredient strings  
    - prepTime, cookTime, totalTime: ISO8601 durations (e.g. PT45M)  
    - nutrition: an object with calories, fatContent, proteinContent, carbohydrateContent  
    - recipeInstructions: an array of HowToStep objects, each with \"@type\" and \"text\"  
    - nextMeals: an array of 2 or 3 suggestion strings for what to cook next based on nutrition best practices

    No additional text or commentary—return only the JSON."

    
    messages = [{role:"system",content:"You are a recipe assistant. You give detailed step by step instructions to help young adults cook food at home. Call out specific suggestions / indicators which help identify whether they are going right at each step. Include one plating suggestion and a chef's tip."},{role:"user", content:prompt_text}]

    if the_recipe.valid?
      
      api_response=OPENAI_CLIENT.chat(:parameters=> {:model =>"gpt-3.5-turbo",:messages=>messages, functions:[RECIPE_SCHEMA],function_call:{name:"generate_recipe"}})
      choices=api_response.fetch("choices")
      first_choice=choices.at(0)
      message_hash = first_choice.fetch("message")
      func_call=message_hash.fetch("function_call")
      arguments = func_call.fetch("arguments")
      data = JSON.parse(arguments)
      the_recipe.full_recipe = data
      the_recipe.ingredients = data["recipeIngredient"]
      the_recipe.total_time = data["totalTime"]
      the_recipe.recipe_instructions = data["recipeInstructions"]
      the_recipe.next_meals = data["nextMeals"]
      the_recipe.nutrition = data["nutrition"]
      the_recipe.save


      redirect_to("/recipes/"+the_recipe.id.to_s, { :notice => "Recipe created successfully." })
    else
      redirect_to("/recipes", { :alert => the_recipe.errors.full_messages.to_sentence })
    end
  end

 
  def show
    the_id=params.fetch("path_id")
    matching_recipes=Recipe.where({:id=>the_id})
    @the_recipe=matching_recipes.at(0)
    render({ :template => "recipes/show" })
  end

end
