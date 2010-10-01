class HomeController < ApplicationController
  session :disabled => true
  
  def index
    today = Date.today
    @last_day = Holiday.lastDay(today).first
    @next_day = Holiday.nextDay(today).first
    diff = @next_day.holiday_at - today

    @diff_name = "%d日後" % diff
    case diff
    when 0
      @diff_name = "今日"
    when 1
      @diff_name = "明日"
    end
  end
end
