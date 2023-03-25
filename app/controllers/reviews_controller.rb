class ReviewsController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    review = report.reviews_new
    review.save_review(review, review_params)
    redirect_to report_path(report.id)
  end
  
private
  def review_params
    params.require(:review).permit(:content).
           merge(user_id: current_user.id, report_id: params[:report_id])
  end
end
