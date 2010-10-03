class HomeController < ApplicationController
  session :disabled => true
  
  def index
    today = Date.today
    @last_day = Holiday.lastDay(today).first
    @next_day = Holiday.nextDay(today).first
  end
end
