# == Schema Information
#
# Table name: cuisines
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cuisine < ApplicationRecord
  has_many  :recipes, class_name: "Recipe", foreign_key: "cuisine_id", dependent: :destroy
end
