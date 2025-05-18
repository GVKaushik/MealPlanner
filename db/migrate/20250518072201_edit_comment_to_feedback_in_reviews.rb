class EditCommentToFeedbackInReviews < ActiveRecord::Migration[7.1]
  def change
    rename_column :reviews, :comment, :feedback
    change_column :reviews, :feedback, :text
  end
end
