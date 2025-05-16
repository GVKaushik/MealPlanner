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
    the_recipe.course = params.fetch("course")
    the_recipe.cuisine = params.fetch("cuisine")
    the_recipe.notes = params.fetch("notes")

    #prompt_text = "I need you to create a step by step recipe for #{the_recipe.dish}. More details about the dish: cuisine is #{the_recipe.cuisine}, it is a #{the_recipe.course} course. The user is #{current_user.expertise} chef. They also dietary preferences as #{current_user.diet_preferences} and are allergic to #{current_user.allergies}. The output needs to be structured as - first, give a bullet point ingredient list. Next, give approximate time to cook. Follow that with an estimate of macronutrients in this dish. Then, give a step by step recipe based on the user's profile shared earlier. Based on the user's profile and macronutrients in the current dish, give 2-3 suggestions the user can choose from for their next meal. Optimize for overall nutrition while giving suggestions."

    # Swap the variable once user profile sheet is created
    prompt_text = "I need you to create a step by step recipe for #{the_recipe.dish}. More details about the dish: cuisine is #{the_recipe.cuisine}, it is a #{the_recipe.course} course. The output needs to be structured as - first, give a bullet point ingredient list. Next, give approximate time to cook. Follow that with an estimate of macronutrients in this dish. Then, give a step by step recipe. Based on the macronutrients in the current dish, give 2-3 suggestions the user can choose from for their next meal. Optimize for overall nutrition while giving suggestions."

    if the_recipe.valid?
      
      api_response=OPENAI_CLIENT.chat(:parameters=> {:model =>"gpt-3.5-turbo",:messages=>[{"role"=>"system","content"=> "You are a helpful recipe assistant"}, {"role"=>"user","content"=>prompt_text}]})
      choices=api_response.fetch("choices")
      first_choice=choices.at(0)
      message_hash=first_choice.fetch("message")
      user_recipe=message_hash.fetch("content")
      the_recipe.full_recipe = user_recipe

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
