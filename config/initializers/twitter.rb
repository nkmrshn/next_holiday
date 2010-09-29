begin
  twitter = YAML.load(File.read(Rails.root.to_s + "/config/twitter.yml"))
rescue
  twitter = {
    "consumer_key" => ENV['CONSUMER_KEY'],
    "consumer_secret" => ENV['CONSUMER_SECRET'],
    "twitter_id" => ENV['TWITTER_ID']
  }
ensure
  NextHoliday::Application.config.twitter_consumer_key = twitter["consumer_key"]
  NextHoliday::Application.config.twitter_consumer_secret = twitter["consumer_secret"]
  NextHoliday::Application.config.twitter_id = twitter["twitter_id"]
end
