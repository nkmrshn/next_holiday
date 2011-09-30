class HomeController < ApplicationController
  def index
    today = Time.zone.today
    @last_day = Holiday.lastDay(today).first
    @next_day = Holiday.nextDay(today).first
    respond_to do |format|
      format.html
      format.xml { render :xml => [@last_day, @next_day] }
    end
  end
end
