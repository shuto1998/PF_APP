class Admin::ReportsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @reports = Report.page(params[:page]) 
  end

  def show
    @report = Report.find(params[:id])
    @customer = @report.customer
    @result = {"1" => "アポ取得", "2" => "アポ未取得", "3" => "日程調整中"}
  end
  
  private
  
  def report_params
    params.require(:report).permit(:report_text,:result,:next,:corporate_id)
  end
end
