# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  comment    :date
#  rating     :integer
#  repeat     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :integer
#  user_id    :integer
#
class Review < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :recipe, required: true, class_name: "Recipe", foreign_key: "recipe_id"
  has_many  :photos, class_name: "ReviewPhoto", foreign_key: "review_id", dependent: :destroy
end
