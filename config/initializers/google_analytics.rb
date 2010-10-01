begin
  ga = YAML.load(File.read(Rails.root.to_s + "/config/google_analytics.yml"))
rescue
  ga = {
    "account" => ENV['GA_ACCOUNT'],
    "domain_name" => ENV['GA_DOMAIN_NAME']
  }
ensure
  NextHoliday::Application.config.ga_account = ga["account"]
  NextHoliday::Application.config.ga_domain_name = ga["domain_name"]
end
