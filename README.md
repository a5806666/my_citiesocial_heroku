# [Mycitiesocial](https://serene-harbor-48921.herokuapp.com/)
<!-- ###### tags: `github`  -->
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
Ruby on Railsを通してアプリを作成しているうちに、
Railsの仕組みと知識、MVCモデル、Railsのルーターなど徐々に使い方を理解してきました。
```
---
## 使い方の紹介
### トップ画面
```markdown
記事リストが一覧で表示されている、気に入りる記事の下にコメントやいいね付くことができます。
```
![](https://i.imgur.com/uaFTm4M.gif)
### アカウント管理 ＆ 記事一覧 画面
```markdown
アカウント管理：アカウントに関するパスワード、ユーザー名、画像など変更を行います。

記事一覧：記事を再編集、公開をキャンセル、記事を削除。
```
![](https://i.imgur.com/fhdY7cv.gif)


---

## URL：
<font size="4">**https://whispering-citadel-92558.herokuapp.com/**</font>

---

## テスト用アカウント　＆　関連リンク

| テスト用     | アカウント          |
| ------------ | ------------------- |
| メール       | sample@gmail.com    |
| パスワード   | 11111111            |

| **テスト用** | **カード**          |
| ------------ | ------------------- |
| カード番号   | 4111 1111 1111 1111 |
| 有効期限     | 02 / 25             |

| タイトル　　　　　　　　　　　　| リンク　　　　　　　　　　　|
| --------------------------|:------------------------ |
| 私のブログ（中国語）　　　　　　|　[:link:][blog]　　　　　　|
| 受講したオンライン講座（中国語）|　[:link:][オンライン講座]　　|

[blog]: http://translate.google.com/translate?hl=en&sl=zh-CN&tl=ja&u=https%3A%2F%2Fhackmd.io%2F%407beedhBrQk2FjyAtSY5wxQ&sandbox=1
[オンライン講座]: http://translate.google.com/translate?hl=en&sl=zh-CN&tl=ja&u=https%3A%2F%2Fcampus.5xruby.tw%2Fp%2Fcoding

---

## 使用技術
* Ruby 2.6.7
* ruby on rails 6.1.3
* ubuntu 20.04
* postgreSQL 13.2
* Stimulus
* CSS/bulma
* GitHub
* Sourcetree
---
## インフラ
* Heroku
* AWS
    * S3
    * IAM 

---
## 機能一覧、使用したgemなど
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
  
        