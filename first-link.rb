require 'open-uri'
require 'nokogiri'


def make_html(source)
  charset = nil

  html = open(source) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
  end
  # htmlをパースしてオブジェクトを作成
  @document = Nokogiri::HTML.parse(html, nil, charset)
  return @document
end

# スクレイピング先のURLを入力
puts '最初のキーワードのURLを入力してください'
url = gets.chomp
make_html(url)

# 概要の箇所を抽出し、keywordに代入
first_keyword = @document.xpath('//h1').inner_text

root = []
root << first_keyword

# 最初のpタグ内のaタグを抽出
second_link = @document.xpath('//div[@class="mw-parser-output"]/p').first.xpath('.//a')

node2 = []
node2 << second_link.first.inner_text
root << node2

new_link = "https://ja.wikipedia.org/#{second_link.attribute('href').value}"


# 2周目
url = new_link
make_html(url)

third_link = @document.xpath('//div[@class="mw-parser-output"]/p').first.xpath('.//a')

node3 = []
node3 << third_link.first.inner_text
node2 << node3

new_link = "https://ja.wikipedia.org/#{third_link.attribute('href').value}"


# 3周目
url = new_link
make_html(url)

forth_link = @document.xpath('//div[@class="mw-parser-output"]/p').first.xpath('.//a')
node4 = []
node4 << forth_link.first.inner_text
node3 << node4

# 出力
puts root