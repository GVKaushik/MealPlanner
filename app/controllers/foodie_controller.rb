class FoodieController < ApplicationController
  def homepage
    render({ :template => "foodie/homepage" })
  end

  def feed
    render({ :template => "foodie/feed" })
  end
end
