class HomeController < ApplicationController
  
  def index
    today = Date.today
    last_day = Holiday.lastDay(today).first
    next_day = Holiday.nextDay(today).first
    diff = next_day.holiday_at - today

    diff_name = "%d日後" % diff
    case diff
    when 0
      diff_name = "今日"
    when 1
      diff_name = "明日"
    end

    @status = "前回の祝日は、%sでした。次回は、%sの%s、『%s』です。" % [
      last_day.name, 
      diff_name,
      next_day.holiday_at.strftime("%m/%d"),
      next_day.name
    ]
  end
end
