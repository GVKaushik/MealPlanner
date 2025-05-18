class AddNutritionToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :nutrition, :jsonb, default:[],null:false
  end
end
