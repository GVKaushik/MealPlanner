# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  cuisine     :string
#  dish_type   :string
#  full_recipe :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Recipe < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :reviews, class_name: "Review", foreign_key: "recipe_id", dependent: :destroy
end
