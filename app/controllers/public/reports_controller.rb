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
    @comment = Comment.new
    @result = { '1' => 'アポ取得', '2' => 'アポ未取得', '3' => '日程調整中' }
  end

  def edit
    @report = Report.find(params[:id])
    @customer = @report.customer
    redirect_to reports_path if @customer != current_customer
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
    @report = Report.new
    @reports = Report.page(params[:page])
  end

  def search
    if params[:name].present?

      corporates = Corporate.where('name LIKE ?', "%#{params[:name]}%")
      corporate_ids = corporates.pluck(:id)
      @reports = Report.where(corporate_id: corporate_ids).page(params[:page])
    else
      @reports = Report.none.page(params[:page])
    end
    @report = Report.new
    render :index
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to reports_path
  end

  private

  # def ensure_customer
  #   @reports = current_customer.reports
  #   @report = @report.find_by(id: params[:id])
  #   redirect_to new_report_path unless @customer
  # end

  def report_params
    params.require(:report).permit(:report_text, :result, :next, :corporate_id)
  end
end
