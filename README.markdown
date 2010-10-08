Next Holiday Twitter bot
========================

This Twitter bot is for Japanese holiday. It will tweet "when is the next holiday" in Japanese.

Preparation
-----------

1. Create a Twitter account for the application.
2. Access to "https://twitter.com/apps".
3. Add a new application.
   - The application type is "Browser".
   - Don't forget the callback URL, which can be any.
   - The default access type is "Read & Write".
   - Check 'Yes, use Twitter for login' in the "use Twitter for login".
4. Get the consumer key and consumer secret.

Installation
------------

Run these commands:

    $ git clone git://github.com/nkmrshn/next_holiday.git
    $ cd next_holiday
    $ bundle install
    $ vi config/twitter_example.yml  # modify the consumer key and secret
    $ mv config/twitter_example.yml twitter.yml
    $ rake db:migrate
    $ rails server

Access to "http://localhost:3000/admin" by your web browser and authenticate the application. Please note the to re-authenticate, you have to delete the database record in the accounts table.

Usage
-----
Make cron job for every day and run "rake cron".

or

If you want to force to tweet, call "Holiday.tweet(true)" from Rails console or runner.

    $ rails runner "Holiday.tweet(true)"

Others
------

1. Environment Variables

    If you can't create config/twitter.yml in the server, config/initializers/twitter.rb will try to read environment variables.

    Example for [*Heroku*](http://heroku.com/), you can add environment variables by executing these commands:

        $ heroku config:add CONSUMER_KEY=<value>
        $ heroku config.add CONSUMER_SECRET=<value>
        $ heroku config:add TWITTER_ID=<value>

    Please read [*Heroku | Config vars*](http://docs.heroku.com/config-vars) for more details.

2. Session Management

    The session is managed by database. The rake task "rake cron" will delete old session records from the database.

3. Google Analytics (Optional)

    If there was config/google_analytics.yml or environment variables(GA_ACCOUNT, GA_DOMAIN_NAME), the JavaScript for Google Analysis will render inside the head tag section.
