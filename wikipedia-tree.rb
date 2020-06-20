require 'open-uri'
require 'nokogiri'

# スクレイピング先のURLを入力
puts '最初のキーワードのURLを入力してください'
url = gets.chomp

charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

# htmlをパースしてオブジェクトを作成
document = Nokogiri::HTML.parse(html, nil, charset)

# 検索キーワードの抽出と出力
keyword = document.xpath('//h1').inner_text

# 最初のpタグを抽出し、その中のaタグを出力
next_link = document.xpath('//div[@class="mw-parser-output"]/p').first.xpath(".//a")

# 最初のキーワードとそのリンク先を結合して出力
next_link.each do |word|
  puts "#{keyword} ー #{word.inner_text}"
end
