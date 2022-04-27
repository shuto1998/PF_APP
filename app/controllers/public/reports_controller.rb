class Public::ReportsController < ApplicationController
  def new
    @report = Report.new
  end
  
  def create
    @report = Report.new(report_paramas)
    if @report.save
      redirect_to report_path(@report.id)
    else
      render :new
    end
  end

  def show
    @reports = Report.find(params[:id])
  end

  def edit
    @report = Report.find(params[:id])
  end
  
  def update
    report = Report.find(params[:id])
    report.update(report_paramas)
    redirect_to report_path(@report.id)
  end

  def index
    @reports = Report.all
  end
  
  private
  def report_paramas
    params.require(:report).permit(:report_text,:result,:next)
  end
end
