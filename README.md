2023/5/20時点でこのリポジトリが指定するRuby -vは2.6.3
2.6.5のmacbookで起動するなら、clone後に.ruby-versionとGemfileの記述バージョンを変更して bundle & yarn する

gem rails-admin入れたいなら、
1. `gem 'rails_admin', '~> 3.0'` 
2. bundle
3. rails g rails_admin:install namespaceがadminでいいならEnter
以下エラーの場合はYで上書き
```
error @hotwired/turbo@7.3.0: The engine "node" is incompatible with this module. Expected version ">= 14". Got "12.16.1"
...
Overwrite /Users/tanakashun/Desktop/サンプルアプリ系/bookers2-debug/package.json? (enter "h" for help) [Ynaqdhm]
```

6. yarn
7. rails c
8. css当たってないので要調査
