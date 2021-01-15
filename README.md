### サイト概要
生命保険契約者専用のマイページです。<br>
- ご契約者はマイページを活用することでWEB上で保険金を請求することができます。
- 生命保険会社は管理者画面より、保険金請求データの閲覧・削除等ができます。また、同データをCSV出力し、出力されたデータをもとに支払査定を行います。
- 生命保険会社は管理者画面より、生命保険の紹介投稿を行い、ユーザー側のトップページ上に紹介投稿を表示することで、契約者へ生命保険のPRを行います。
- 契約者は気になった生命保険に関する投稿をお気に入り登録することができます。

### 同サイトの作成理由・目的
- 生命保険会社では、対面による保険金請求や営業活動が一般的であったものの、近年のコロナ禍により、非対面チャンネルによる保険金請求、商品PRの需要が高まっており、WEBサービスによってこれらの需要に対応したかったためです。
- 保険業界各社では、人口減少に伴う経年的な契約件数の減少により、業務効率化による人件費の圧縮が求められています。保険金請求がWEB上にて完結できれば、保険窓口での対応等が不要となり、業務効率化を促進できるものと考えたためです。

### ターゲットユーザ
- 生命保険に加入されている方で、遠方等により、保険窓口へ来ることが困難な方
- 生命保険に加入されている方で、コロナ禍により、外出を自粛せざるを得ない方
- 保険金の支払審査業務ご担当者様
- 商品広報に携わるご担当者様

### 機能一覧
- ユーザー登録、変更、退会
- ログイン、ログアウト機能（ゲストログイン）
- 契約登録、編集、削除
- 保険金請求
- お気に入り登録
- 管理者画面
- CVS出力
- 商品PR記事投稿、削除
- 画像アップロード

### 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,Ruby,SQL
- フレームワーク：Ruby on Rails

### 技術一覧
- インフラ：heroku
- データベース：PostgreSQL
- セッション管理：Cookie
- 画像アップロード：carrierwave、cloudinary
- 管理者：boolean型による判定
- テスト：rspec
- 多言語化
