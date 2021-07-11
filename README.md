# [Mycitiesocial](https://serene-harbor-48921.herokuapp.com/)
###### tags: `github` 
<font size="4">**アプリケーション概要：**</font>
```markdown
ウェブデザインと決済手続きをシンプル化し、ユーザーが使いやすいECサイトです。
```

<font size="4">**作成の目的：**</font>
<!-- 現在越來越多使用者在網路上購買東西而且在日line使用率也非常高 -->
```markdown
line payのような電子決済サービスと連携するオンラインショップの使用者がだんだん増えてくるので、
ユーザのニーズを満足させるため、操作がシンプルでスマホ決済ができる便利なECサイトを作りたいと思います。
```
---

## 管理者アカウント　＆　関連リンク

| 管理者     | アカウント          |
| ------------ | ------------------- |
| メール       | admin@gmail.com    |
| パスワード   | 11111111            |

| タイトル　　　　　　　　　　　　| リンク　　　　　　　　　　　|
| --------------------------|:------------------------ |
| 私のブログ（中国語）　　　　　　|　[:link:][blog]　　　　　　|
| 受講したオンライン講座（中国語）|　[:link:][オンライン講座]　　|

[blog]: http://translate.google.com/translate?hl=en&sl=zh-CN&tl=ja&u=https%3A%2F%2Fhackmd.io%2F%407beedhBrQk2FjyAtSY5wxQ&sandbox=1
[オンライン講座]: http://translate.google.com/translate?hl=en&sl=zh-CN&tl=ja&u=https%3A%2F%2Fcampus.5xruby.tw%2Fp%2Fcoding

---
## 使い方の紹介　／　URL：<font size="4">**https://serene-harbor-48921.herokuapp.com/**</font>
### トップ画面
```markdown
商品リストが一覧で表示されていて、商品名検索または商品ジャンルから探することもできます。

欲しい商品があったら品目と数を入力してカートに入れましょう。
```
![](https://i.imgur.com/Fy5YNIe.gif)

---

### カート．LINE Pay決済の流れ ＆ 注文履歴 画面
```markdown
カート画面：購入したい商品価格と数と合計を再確認したら、レジに進み注文を確定します。
ほかには商品を削除、買い物を続けるもできます。

会計画面：お届け先を入力して、Line Pay 決済ボタン押したら、決済ページに移動します。

LINE Pay決済：スマホのlineで画面に表示されるQRコードをスキャンして、
表示された金額を確認完了後、決済しましょう。（LINE Pay決済はサンドボックスモードです。ご安心ください）

注文履歴画面：これまでの注文日、注文番号、取引金額や狀態が確認できます。
```
![](https://i.imgur.com/IxQGuBp.gif)


---

### 商品管理システム
```markdown
管理者アカウントでログインすれば、商品管理システムに入れます。

メーカー管理：メーカーに関する名前、説明、公開など追加や編集を行います

ジャンル管理：商品をジャンルごとに分類して表示する機能です。
ジャンルの表示順序を並び替えると、トップページの表示場所はジャンル管理の表示順序によって異なります。

商品管理：登録した商品が一覧で表示されている、または商品を追加、在庫管理、編集、削除などもできます。
```
![](https://i.imgur.com/d37r7LW.gif)

---

## 使用技術
* Ruby 2.6.7
* ruby on rails 6.1.3
* ubuntu 20.04
* postgreSQL 13.2
* Stimulus
* CSS/bulma
* Postman
* GitHub
* Heroku
* AWS
    * S3
    * IAM 

---
## 機能一覧、使用したgemなど

### フロントエンド

* ユーザー登録機能、Google ＆ ログイン機能（[devise](https://hackmd.io/nYCmlVBYTgGy4vYKYyr-Gw)、[omniauth-google-oauth2](https://github.com/zquestz/omniauth-google-oauth2)）
    * マイページ機能（devise）
        * パスワードの変更
    * カート機能
        * Line Pay 決済機能（Line Pay、[faraday](https://lostisland.github.io/faraday/)）
    * 注文履歴機能
        * 注文履歴の確認や再決済・キャンセル（[AASM](https://github.com/aasm/aasm)）
* 商品名検索機能 

### バックエンド

* メーカー管理機能
    * 一覧表示、詳細表示、登録、編集、削除（[paranoia](https://github.com/rubysherpas/paranoia)） 
* ジャンル管理機能
    * 一覧表示、詳細表示、登録、編集、削除（paranoia）
    * ジャンルの表示順序を並び替える（[SortableJS](https://github.com/SortableJS/Sortable)）
* 商品管理機能
    * 一覧表示、詳細表示、登録、編集、削除（Rails ActionText、paranoia） 
    * ページネーション機能（[Kaminari](https://qiita.com/residenti/items/1ae1e5ceb59c0729c0b9)）

---

## テスト
* RSpec
    * カートテスト(models spec)