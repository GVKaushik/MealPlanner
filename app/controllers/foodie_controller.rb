class FoodieController < ApplicationController
  def homepage
    render({ :template => "foodie/homepage" })
  end
end
