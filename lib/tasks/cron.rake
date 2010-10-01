desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  Holiday.tweet
  Session.expired.delete_all
end
