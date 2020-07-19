class CheersController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @report = Report.find(params[:report_id])
    current_user.like(@report)
    flash[:success] = '応援しました！'
    redirect_to root_path
  end
  
  def destroy
    @report = Report.find(params[:report_id])
    current_user.unlike(@report)
    flash[:success] = '応援を解除しました。'
    redirect_to root_path
  end
end
