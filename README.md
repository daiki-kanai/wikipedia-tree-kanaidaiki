# README


## 課題
Wikipedia内任意のページの概要から、Wikipedia内へのリンクを抽出し、さらにリンクを辿っていくことで関連キーワードのツリーを出力する。


## 開発環境
ruby 2.5.1


## 進行度
ご提示いただいた要件は満たしておらず、<br>
現状動作確認できるものは、Wikipedia内任意のページの概要から最初のリンクのみを取得して辿っていくというものです。（first-link.rb）<br>

複数リンクからさらに複数リンクを辿るといった再帰的なプログラムについて現在試行錯誤中です。(wikipedia-tree.rb)


## 動作確認

### ０.Nokogiriのインストール（未インストールの場合のみ）
スクレイピングにRubyのライブラリの『Nokogiri』を用いているので、インストールをお願いします。<br>
$ gem install nokogiri

### １.当ディレクトリのクローン
$ git clone https://github.com/daiki-kanai/wikipedia-tree-kanaidaiki.git

### ２.プログラムの実行
当該ディレクトリにて<br>
$ ruby first-link.rb<br>
と入力し実行をお願いします。<br>
"最初のキーワードのURLを入力してください"<br>
と応答があるので、適当なWikipediaページのURLを入力し確認をお願いします。<br>
3回リンクを辿り終了としています。

---
