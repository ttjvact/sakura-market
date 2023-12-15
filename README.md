## 使い方

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、 Gems をインストールします。

```
$ bundle install
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
$ rails db:seed
```

最後に、テストを実行してうまく動いているかどうか確認してください。

```
$ rails test
```

サーバーの実行でアプリが起動します。

```
$ rails server
or 
$ ruby bin/rails server
```