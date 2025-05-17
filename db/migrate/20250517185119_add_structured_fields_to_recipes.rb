class AddStructuredFieldsToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :ingredients, :jsonb, default:[],null:false
    add_column :recipes, :total_time, :string
    add_column :recipes, :recipe_instructions, :jsonb, default:[],null:false
    add_column :recipes, :next_meals, :jsonb, default:[],null:false
  end
end
