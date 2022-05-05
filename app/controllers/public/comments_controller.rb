class Public::CommentsController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    comment = current_customer.comments.new(comment_params)
    comment.report_id = report.id
    comment.save
    redirect_to report_path(report.id)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to report_path(params[:report_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
