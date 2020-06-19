require 'open-uri'
require 'nokogiri'

# スクレイピング先のURL
url = 'https://ja.wikipedia.org/wiki/%E3%83%AA%E3%83%B3%E3%82%B4'

charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

# htmlをパースしてオブジェクトを作成
document = Nokogiri::HTML.parse(html, nil, charset)

# 検索キーワードの抽出と出力
keyword = document.xpath('//h1').inner_text
puts keyword

# 最初のpタグを抽出し、その中のaタグを出力
next_link = document.xpath('//div[@class="mw-parser-output"]/p').first.xpath(".//a").inner_text
puts next_link