twitter = YAML.load(File.read(Rails.root.to_s + "/config/twitter.yml"))
NextHoliday::Application.config.twitter_consumer_key = twitter["consumer_key"]
NextHoliday::Application.config.twitter_consumer_secret = twitter["consumer_secret"]
