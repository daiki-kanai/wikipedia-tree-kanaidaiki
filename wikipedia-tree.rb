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

# 概要の箇所を抽出し、keywordに代入（最初に入力したワード）
first_keyword = @document.xpath('//h1').inner_text
@root = []
@root << first_keyword
# puts node

#最初のpタグを抽出し、その中のaタグを出力
# second_links = @document.xpath('//div[@class="mw-parser-output"]/p').first.xpath('.//a')
first_paragraph = @document.xpath('//div[@class="mw-parser-output"]/p').first
first_paragraph.xpath('.//a').each do |link|
  @node2 = []
  @node2 << link.inner_text
  @root << @node2
end
# 試しに
node3 = []
node3 << "sample"
@node2 << node3
puts @node2