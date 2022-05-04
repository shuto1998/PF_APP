class Public::CommentsController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    comment = currentcustomer.comment.new(comment_params)
    comment.report_id = report.id
    comment.save
    redirect_to report_path(report.id)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(comment)
  end
end
