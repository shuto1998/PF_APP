class Public::ReportsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @report = Report.new(corporate_id: params[:corporate_id])
    @corporate = Corporate.find(params[:corporate_id])
  end

  def create
    @report = Report.new(report_params)
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
    @customer = @report.customer
    @result = {"1" => "アポ取得", "2" => "アポ未取得", "3" => "日程調整中"}
  end

  def edit
    @report = Report.find(params[:id])
    @customer = @report.customer
    if @customer != current_customer
    redirect_to reports_path
    end
  end

  def update
    report = Report.find(params[:id])
    if report.update(report_params)
      redirect_to report_path(report.id)
    else
      render :edit
    end
  end

  def index
    @reports = Report.all
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to new_report_path
  end

  private

  # def ensure_customer
  #   @reports = current_customer.reports
  #   @report = @report.find_by(id: params[:id])
  #   redirect_to new_report_path unless @customer
  # end

  def report_params
    params.require(:report).permit(:report_text,:result,:next,:corporate_id)
  end
end
