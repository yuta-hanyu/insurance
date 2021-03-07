### アプリケーション概要
生命保険加入者が、窓口に行かずとも、保険金請求やお問合せ等を行うことができるアプリケーションです。<br>

### 機能紹介（各機能はSPA化）
機能は管理者とユーザーで分岐しており、ユーザーはWEB上で保険金請求、加入契約の管理、保険商品の気に入り登録を行なうことができます。<br>
また、メール機能を用いず、アプリ内で資料請求等のお問い合わせやお問い合わせに対する管理者からの返信へ、さらに返信することができます。<br>
管理者は保険金請求データの閲覧とCSV出力、お問い合わせへの返信、商品PR投稿ができます。投稿したPRはユーザー側のトップページ上に表示することで、契約者へ生命保険のPRを行うことができます。

#### ＜機能一覧＞
- ユーザー登録、変更、退会
- ログイン、ログアウト機能、ゲストログイン機能
- 契約登録、編集、削除
- 保険金請求機能と請求データのCVS出力
- お気に入り登録
- 商品PR記事の投稿、削除
- お問い合わせとお問い合わせに対する返信（相互に繰り返し返信することができます）
- 画像アップロード


### 作成理由・目的
- 生命保険業界においては、コロナ禍により対面による営業や各種手続の機会損失が懸念されています。
- 請求手続や保険商品をPRすることができるWEBアプリケーションがあれば、懸念は解消されるものと考え、生命保険契約者専用のWEBアプリケーションを開発しました。

### ターゲットユーザ
- 生命保険に加入されている方で、コロナや遠方等により、保険窓口へ来ることが困難な方
- 保険金の支払審査業務ご担当者様
- 商品広報に携わるご担当者様


### 開発環境
- OS：Linux
- 使用言語：HTML5, SCSS, Ruby(2.6.3), MySQL, JavaScript
- フレームワーク：Ruby on Rails(5.2.4), Vue.js(2.6.12)（APIにのみ使用。学習中。）

### 技術一覧
- インフラ：AWS
- データベース：MYSQL
- セッション管理：Cookie
- 画像アップロード：refile
- 管理者：boolean型による判定
- テスト：rspec（一部の機能のみ。コーディング中。）
- 多言語化 : i18n使用
- 非同期通信：画像プレビュー、各機能（CRUD処理）の完全SPA化、住所自動検索
- API : zipcloudによる住所自動検索
- CI/CD : GitHubActionsによる自動デプロイ

