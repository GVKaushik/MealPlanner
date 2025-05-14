class ReviewPhotosController < ApplicationController
  def index
    matching_review_photos = ReviewPhoto.all

    @list_of_review_photos = matching_review_photos.order({ :created_at => :desc })

    render({ :template => "review_photos/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_review_photos = ReviewPhoto.where({ :id => the_id })

    @the_review_photo = matching_review_photos.at(0)

    render({ :template => "review_photos/show" })
  end

  def create
    the_review_photo = ReviewPhoto.new
    the_review_photo.image = params.fetch("query_image")
    the_review_photo.review_id = params.fetch("query_review_id")

    if the_review_photo.valid?
      the_review_photo.save
      redirect_to("/review_photos", { :notice => "Review photo created successfully." })
    else
      redirect_to("/review_photos", { :alert => the_review_photo.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_review_photo = ReviewPhoto.where({ :id => the_id }).at(0)

    the_review_photo.image = params.fetch("query_image")
    the_review_photo.review_id = params.fetch("query_review_id")

    if the_review_photo.valid?
      the_review_photo.save
      redirect_to("/review_photos/#{the_review_photo.id}", { :notice => "Review photo updated successfully."} )
    else
      redirect_to("/review_photos/#{the_review_photo.id}", { :alert => the_review_photo.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_review_photo = ReviewPhoto.where({ :id => the_id }).at(0)

    the_review_photo.destroy

    redirect_to("/review_photos", { :notice => "Review photo deleted successfully."} )
  end
end
