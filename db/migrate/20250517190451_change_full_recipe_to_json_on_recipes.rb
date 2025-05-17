class ChangeFullRecipeToJsonOnRecipes < ActiveRecord::Migration[7.1]
  def change
    change_column :recipes, :full_recipe, :jsonb, using:  'full_recipe::jsonb', default: {}
  end
end
