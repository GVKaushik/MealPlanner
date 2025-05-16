class RenameDishTypeAndNameInRecipes < ActiveRecord::Migration[7.1]
  def change
    rename_column(:recipes,:dish_type,:course)
    rename_column(:recipes,:name,:dish)
  end
end
