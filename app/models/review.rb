class Review < ApplicationRecord
  belongs_to :report
  belongs_to :user
  
  def save_review(review, review_params)
    review.content = review_params[:content]
    review.user_id = review_params[:user_id]
    review.report_id = review_params[:report_id]
    save
  end
end
