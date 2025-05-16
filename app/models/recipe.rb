# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  course      :string
#  cuisine     :string
#  dish        :string
#  full_recipe :text
#  notes       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Recipe < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :reviews, class_name: "Review", foreign_key: "recipe_id", dependent: :destroy
end
