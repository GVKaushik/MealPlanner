class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :recipe_id
      t.integer :user_id
      t.integer :rating
      t.date :comment
      t.boolean :repeat

      t.timestamps
    end
  end
end
