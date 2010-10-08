Next Holiday Twitter bot
========================

このTwitter botは、日本の祝日を対象としています。このアプリは、次の祝日をツイートします。 

![Next Holiday](http://github.com/nkmrshn/next_holiday/raw/master/doc/next_holiday_example.png)

準備
----

1. このアプリ用にツイッターのアカウントを作成してください。
2. "https://twitter.com/apps"にアクセスしてください。
3. 新しいアプリを追加してください。
   - アプリケーションの種類は、"ブラウザアプリケーション"です。
   - コールバックURLは適当に忘れず入力してください。
   - Default access typeは、"Read & Write".
   - Twitterでログインするので、[はい、Twitterをログインに使用します。]を有効にしてください。
4. その他の項目を入力・保存後、Consumer keyとConsumer secretを取得してください。

インストール
------------

これらのコマンドを実行してください：

    $ git clone git://github.com/nkmrshn/next_holiday.git
    $ cd next_holiday
    $ bundle install
    $ vi config/twitter_example.yml  # modify the consumer key and secret
    $ mv config/twitter_example.yml twitter.yml
    $ rake db:migrate
    $ rails server


ブラウザで"http://localhost:3000/admin"にアクセスし、このアプリの承認してください。もし、再承認する場合は、データベースのaccountsテーブルにあるレコードを削除してください。

使い方
------

毎日1回、"rake cron"を実行するcronジョブを作成・実行してください。

もしくは、強制的にツイートさせたい場合、Railsコンソールかランナーで"Holiday.tweet(true)"を実行してください。

    $ rails runner "Holiday.tweet(true)"

その他
------
 
1. 環境変数

    サーバにconfig/twitter.ymlを作成できない場合、config/initializers/twitter.rbは、環境変数を読もうとします。

    例えば[*Heroku*](http://heroku.com/)では、これらのコマンドを実行することによって環境変数を追加できます：
 
        $ heroku config:add CONSUMER_KEY=<value>
        $ heroku config.add CONSUMER_SECRET=<value>
        $ heroku config:add TWITTER_ID=<value>

    詳しくは、[*Heroku | Config vars*](http://docs.heroku.com/config-vars)をご覧ください。 

2. セッション管理

    セッションはデータベースで管理しています。古いセッションのレコードは、"rake cron"でデータベースから削除します。

3. Google Analytics (オプション)

    config/google_analytics.ymlあるいは、環境変数(GA_ACCOUNT, GA_DOMAIN_NAME)がある場合、Google AnalyticsのJavaScriptをheadタグ内に生成します。
