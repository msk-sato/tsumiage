class ToppagesController < ApplicationController
  def index
    if logged_in?
      @report = current_user.reports.build  # form_with 用
      @reports = current_user.feed_reports.order(id: :desc).page(params[:page])
    end
  end
end
