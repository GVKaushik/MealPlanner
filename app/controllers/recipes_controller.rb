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

    if the_recipe.valid?
      the_recipe.save
      










      redirect_to("/recipes/"+the_recipe.id.to_s, { :notice => "Recipe created successfully." })
    else
      redirect_to("/recipes", { :alert => the_recipe.errors.full_messages.to_sentence })
    end
  end


  #check below
  def show
    the_id = params.fetch("path_id")

    matching_recipes = Recipe.where({ :id => the_id })

    @the_recipe = matching_recipes.at(0)

    render({ :template => "recipes/show" })
  end

  
  def update
    the_id = params.fetch("path_id")
    the_recipe = Recipe.where({ :id => the_id }).at(0)

    the_recipe.user_id = params.fetch("query_user_id")
    the_recipe.name = params.fetch("query_name")
    the_recipe.dish_type = params.fetch("query_dish_type")
    the_recipe.full_recipe = params.fetch("query_full_recipe")
    the_recipe.cuisine = params.fetch("query_cuisine")

    if the_recipe.valid?
      the_recipe.save
      redirect_to("/recipes/#{the_recipe.id}", { :notice => "Recipe updated successfully."} )
    else
      redirect_to("/recipes/#{the_recipe.id}", { :alert => the_recipe.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_recipe = Recipe.where({ :id => the_id }).at(0)

    the_recipe.destroy

    redirect_to("/recipes", { :notice => "Recipe deleted successfully."} )
  end

  def new
    @recipe=Recipe.new
    render({:template=>"recipes/new"})
  end
end
