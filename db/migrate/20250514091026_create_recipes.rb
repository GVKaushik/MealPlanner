class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :name
      t.string :dish_type
      t.text :full_recipe
      t.string :cuisine

      t.timestamps
    end
  end
end
