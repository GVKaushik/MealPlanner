# == Schema Information
#
# Table name: review_photos
#
#  id         :bigint           not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  review_id  :integer
#
class ReviewPhoto < ApplicationRecord
  belongs_to :review, required: true, class_name: "Review", foreign_key: "review_id"
end
