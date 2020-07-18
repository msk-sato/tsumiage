class ReportsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      flash[:success] = '投稿しました。'
      redirect_to root_url
    else
      @reports = current_user.reports.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @report.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  def show
    @report = Report.find_by(id: params[:id])
    @cheers_count = Cheer.where(report_id: @report.id).count
  end
  
  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
  
  def correct_user
    @report = current_user.reports.find_by(id: params[:id])
    unless @report
      redirect_to root_url
    end
  end
end
