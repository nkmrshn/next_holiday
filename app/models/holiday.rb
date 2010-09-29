require 'twitter'

class Holiday < ActiveRecord::Base

  scope :prevDay, lambda { |today|
    where(["holiday_at = ?", today - (today.wday == 1 ? 3 : 1)])
  }

  scope :lastDay, lambda { |today|
    where(["holiday_at < ?", today]).order("holiday_at desc")
  }

  scope :nextDay, lambda { |today|
    where(["holiday_at >= ?", today]).order("holiday_at")
  }

  class << self
    def tweet(force = false)
      today = Date.today
      return if (today.wday == 0 || today.wday == 6) && force == false

      account = Account.first()
      return if account.nil?

      if force
        prev_day = Holiday.lastDay(today).first
      else
        prev_day = Holiday.prevDay(today).first
        return if prev_day.nil?
      end

      next_day = Holiday.nextDay(today).first
      return if next_day.nil?

      diff = next_day.holiday_at - today
      diff_name = "%d日後" % diff
      case diff
      when 0
        return
      when 1
        diff_name = "明日"
      end

      status = "前回の祝日は、%sでした。次回は、%sの%s、『%s』です。" % [
        prev_day.name,
        diff_name,
        next_day.holiday_at.strftime("%m/%d"),
        next_day.name
      ]

      response = Twitter.access_token(account).post(
        '/statuses/update.json',
        { :status => status }
      )

      case response
      when Net::HTTPSuccess
        logger.info "Posted"
      else
        logger.error "Failed to post status"
      end
    end
  end
end
