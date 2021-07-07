# [Mycitiesocial](https://serene-harbor-48921.herokuapp.com/)
###### tags: `github` 
<font size="4">**アプリケーション概要：**</font>

```markdown
余計なものを省いて、使いやすくしたブログです。

有名なブログ「medium」の機能を参考して作成いたしました。
写真付きの記事が投稿できる、お気に入りの記事にコメントやいいね！付くことができます。

就職活動用のポートフォリオとして制作致しました。
```

<font size="4">**作成の目的：**</font>
<!-- 透過Ruby on Rails來建立部落格過程中，初步了解Rails框架的基本使用規則與原理。 -->
<!-- Railsのルーティング、Gem的相關使用方法、資料庫的建立相關規則。 -->
<!-- 在這次的專案中我學會了。 -->
```markdown

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
商品リストが一覧で表示されている、商品名検索または商品ジャンルから探することもできます。

欲しい商品があったら品目と数を入力してカートに入れましょう。
```
![](https://i.imgur.com/Fy5YNIe.gif)

---

### カート．LINE Pay決済の流れ ＆ 注文履歴 画面
```markdown
カート画面：購入したい商品価格と数と合計を再確認したら、レジに進み注文を確定します。
ほかには商品を削除、買い物を続けるもできます。

会計画面：お届け先を入力して、Line Pay 決済ボタンをしたら、決済ページに移動します。

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

ジャンル管理：商品をジャンルごとに分類して表示すること機能です。
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
* GitHub
* Postman
* Sourcetree
* Heroku
* AWS
    * S3
    * IAM 

---
## 機能一覧、使用したgemなど

### フロントエンド

* ユーザー登録機能、ログイン機能（[devise](https://hackmd.io/nYCmlVBYTgGy4vYKYyr-Gw)）
    * アカウント管理機能（devise）
        * パスワードの変更、ユーザー名を設定する、プロフィール画像をアップロード（[Active Storage](https://hackmd.io/@7beedhBrQk2FjyAtSY5wxQ/SyHnoXCwd)）
    * 記事一覧機能
        * 記事を再編集．公開をキャンセル（[AASM](https://github.com/aasm/aasm)）、記事を削除（[paranoia](https://github.com/rubysherpas/paranoia)）
        * ページネーション機能（[Kaminari](https://qiita.com/residenti/items/1ae1e5ceb59c0729c0b9)）
    * 会員登録機能（**決済するのみです**）（[braintree-sandbox](https://developers.braintreepayments.com/start/overview)）
* 記事を投稿する機能（AASM）
    * 記事画像をアップロード（Active Storage）
* 記事にコメントを付ける機能（Ajax）
    * いいね機能（Ajax）
        * 人気記事ランキング機能（ホームページ）
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