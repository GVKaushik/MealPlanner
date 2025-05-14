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
end
