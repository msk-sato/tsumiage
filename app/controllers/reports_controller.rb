class ReportsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @reports = current_user.reports.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @report.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def report_params
    params.require(:report).permit(:content)
  end
  
  def correct_user
    @report = current_user.reports.find_by(id: params[:id])
    unless @report
      redirect_to root_url
    end
  end
end
