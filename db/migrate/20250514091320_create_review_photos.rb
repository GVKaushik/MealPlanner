class CreateReviewPhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :review_photos do |t|
      t.string :image
      t.integer :review_id

      t.timestamps
    end
  end
end
