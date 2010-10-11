class HomeController < ApplicationController
  def index
    today = Time.zone.today
    @last_day = Holiday.lastDay(today).first
    @next_day = Holiday.nextDay(today).first
  end
end
