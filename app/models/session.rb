class Session < ActiveRecord::Base
  scope :expired, where(["updated_at < ?", 1.days.ago])
end
