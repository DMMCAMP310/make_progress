class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
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
    params.require(:report).permit(:name, :item, :content, :category_id)
  end
end
