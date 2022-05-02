class Public::ReportsController < ApplicationController
  before_action :ensure_customer, only: [:edit, :update, :destroy]

  def new
    @report = Report.new(corporate_id: params[:corporate_id])
    @corporate = Corporate.find(params[:corporate_id])
  end

  def create
    @report = Report.new(report_paramas)
    @report.customer_id = current_customer.id
    if @report.save
      redirect_to report_path(@report.id)
    else
      @reports = Report.all
      render :index
    end
  end

  def show
    @report = Report.find(params[:id])
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    if @report.update(report_params)
      redirect_to report_path(@report.id)
    else
      render :edit
    end
  end

  def index
    @reports = Report.all
  end

  def destroy
    @report.destroy
    redirect_to new_report_path
  end

  private

  def ensure_user
    @reports = current_user.reports
    @report = @report.find_by(id: params[:id])
    redirect_to new_report_path unless @customer
  end

  def report_paramas
    params.require(:report).permit(:report_text,:result,:next,:corporate_id)
  end
end
