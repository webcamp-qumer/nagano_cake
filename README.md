# Nagano_cake(ECサイト)
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト。
##案件の背景
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るよう になった。 InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管 理機能を含んだ通販サイトを開設しようと思い至った。
##主な機能
####顧客
・会員登録機能(住所、氏名、電話番号、メールアドレス、パスワード)
・会員ログイン（メールアドレスとパスワード）
・会員退会機能
・会員登録情報を編集
・商品購入機能
・購入履歴表示
####管理者
・商品登録機能
・商品の一覧を表示
・商品の編集
・注文一覧を表示
・注文詳細画面を表示
・顧客の論理削除
・ジャンル登録機能
・ジャンルの一覧を表示
・ジャンルの編集
##ER図
https://drive.google.com/file/d/1cmYAsWgrDqk-yl2S__I4bro8pZbQ4Fqd/view?usp=sharing
##使用技術
###フロントエンド
・HTML 
・CSS(SCSS) 
・bootstrap4
###バックエンド
・ruby 2.6.3p62 
・Rails 6.1.6
##主なGEM
・gem 'devise'
・gem 'jquery-rails'
・gem 'bulma-rails'
・gem "enum_help"
