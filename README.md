## Rubyのバージョンがローカルと異なる場合
2023/5/20時点でこのリポジトリが指定するRuby -vは2.6.3
2.6.5のmacbookで起動するなら、clone後に
1. ruby-versionとGemfileの記述バージョンを変更
2. bundle & yarn する
3. rails db:migrate
4. rails s

### activeadminで管理画面を作る場合
1. gem 'activeadmin'
2. bundle
3. rails g active_admin:install #devise入っている前提
4. 上記が遅かったら、spring stopしてリトライ
5. devise_create_admin_usersのmigrationファイルが自動でできる。devise.rbで admin@example.comをnameにしているなら、nameカラムを作るよう手動でmigrationファイルに追記する
6. seed.rbも自動でできている。nameカラムを手動で追記する
7. migrate
8. seed
9. rails s
10. /admin/login
11. seedにあるadminとpasswordでログイン
12. /admin に入れる
13. 既存モデルを追加する
14. rails g active_admin:resource Book 
15. rails g active_admin:resource BookComment 
16. rails g active_admin:resource Chat
17. rails g active_admin:resource Favorite
18. rails g active_admin:resource GroupUser 
19. rails g active_admin:resource Group 
20. rails g active_admin:resource Impression 
21. rails g active_admin:resource Relationship 
22. rails g active_admin:resource Room 
23. rails g active_admin:resource UserRoom

