Date::DATE_FORMATS.merge!(
  :jp => lambda { |t| t.strftime("%m月%d日(#{%w(日 月 火 水 木 金 土)[t.wday]})") }
)
