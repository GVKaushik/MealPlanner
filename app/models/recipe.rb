# == Schema Information
#
# Table name: recipes
#
#  id                  :bigint           not null, primary key
#  course              :string
#  cuisine             :string
#  dish                :string
#  full_recipe         :jsonb
#  ingredients         :jsonb            not null
#  next_meals          :jsonb            not null
#  notes               :text
#  nutrition           :jsonb            not null
#  recipe_instructions :jsonb            not null
#  total_time          :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#
class Recipe < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :reviews, class_name: "Review", foreign_key: "recipe_id", dependent: :destroy
end
