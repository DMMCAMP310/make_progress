class ReportsController < ApplicationController
  def index
    @reports = Report.display_list(category_params, params[:page])
    @category = Category.request_category(category_params)
    @categories = Category.all
    @major_category_names = Category.major_categories
  end

  def show
    @report = Report.find(params[:id])
    @reviews = @report.reviews
    @review = @reviews.new
  end

  def new
    @report = Report.new
    @categories = Category.all
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      redirect_to report_path(@report), notice: 'レポートを作成しました'
    else
      render 'new'
    end
  end

  def edit
    @report = Report.find(params[:id])
    @categories = Category.all
    if @categories.blank?
      flash[:alert] = 'カテゴリーが設定されていません'
    end
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to report_path(@report.id), notice: 'レポートを編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path
  end

  private

  def report_params
    params.require(:report).permit(:name, :item, :content, :category_id, :image)
  end
  
  def category_params
      params[:category].present? ? params[:category]
                                 : "none"
  end
end
