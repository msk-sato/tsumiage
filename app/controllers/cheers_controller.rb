class CheersController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @report = Report.find(params[:report_id])
    current_user.cheer(@report)
    flash[:success] = '応援しました！'
    redirect_to root_path
  end
  
  def destroy
    @report = Report.find(params[:micropost_id])
    current_user.uncheer(@report)
    flash[:success] = '応援を解除しました。'
    redirect_to root_path
  end
end
