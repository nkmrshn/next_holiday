Next Holiday Twitter bot
========================

This Twitter bot is for Japanese holiday. It will tweet "when is the next holiday" in Japanese, if yesterday or previous week friday was a holiday.

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
