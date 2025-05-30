# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allergies              :string
#  diet_preferences       :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  expertise              :string
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many  :recipes, class_name: "Recipe", foreign_key: "user_id", dependent: :destroy
  has_many  :reviews, class_name: "Review", foreign_key: "user_id", dependent: :destroy
end
