require 'twitter'

class Holiday < ActiveRecord::Base

  scope :prevDay, lambda { |today|
    where(["holiday_at = ?", today - 1])
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

      account = Account.first()
      return if account.nil?

      if force
        prev_day = Holiday.lastDay(today).first
      else
        prev_day = Holiday.prevDay(today).first
      end
      return if prev_day.nil?

      next_day = Holiday.nextDay(today).first
      return if next_day.nil?

      status = "前回の祝日は、%sの「%s」でした。次回は、%sの『%s』です。" % [
        prev_day.holiday_at.to_s(:jp),
        prev_day.name,
        next_day.holiday_at.to_s(:jp),
        next_day.name
      ]

      Twitter.updateStatus(account, status)
    end
  end
end
