class ReviewsController < ApplicationController
  def index
    @the_recipe_id = params.fetch("recipe")
    render({ :template => "reviews/index" })
  end


  def create
    the_review = Review.new
    the_review.recipe_id = params.fetch("recipe_id")
    the_review.user_id = current_user.id
    the_review.rating = params.fetch("rating")
    the_review.feedback = params.fetch("feedback")
    the_review.repeat = params.fetch("repeat", false)

    if the_review.valid?
      the_review.save
      redirect_to("/", { :notice => "Thanks for the feedback! You can look for another recipe now" })
    else
      redirect_to("/reviews", { :alert => the_review.errors.full_messages.to_sentence })
    end
  end

  
end
