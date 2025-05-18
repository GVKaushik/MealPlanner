require "dotenv/load"
require "openai"
::OPENAI_CLIENT = OpenAI::Client.new(:access_token=>ENV.fetch("OPENAI_API_KEY"))

RECIPE_SCHEMA = {name:"generate_recipe", description:"Return a complete recipe as JSON", parameters:{type:"object", properties:{recipeIngredient:{type:"array",items:{type:"string"}},prepTime:{type:"string"},cookTime:{type:"string"},totalTime:{type:"string"},nutrition:{type:"object",properties:{calories:{type:"string"},protein:{type:"string"},carbohydrateContent:{type:"string"},fatContent:{type:"string"}},required:["calories"]},recipeInstructions:{type:"array",items:{type:"object",properties:{"@type":{type:"string"},text:{type:"string"}},required:["@type","text"]}},nextMeals:{type:"array",items:{type:"string"}}},required:["recipeIngredient","recipeInstructions","totalTime","nutrition"]}}.freeze
