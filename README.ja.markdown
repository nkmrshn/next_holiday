Next Holiday Twitter bot
========================

このTwitter botは、日本の祝日を対象としています。このアプリは、前日もしくは前週の金曜日が祝日だった場合、次の祝日をツイートします。 

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
