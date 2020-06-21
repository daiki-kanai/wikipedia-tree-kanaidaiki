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

# 概要の箇所を抽出し、keywordに代入
first_keyword = document.xpath('//h1').inner_text

# tree = []
# tree << keyword

# 最初のpタグを抽出し、その中のaタグを出力
second_link = document.xpath('//div[@class="mw-parser-output"]/p').first.xpath('.//a')

# 最初のキーワードとそのリンク先を結合して出力
# next_link.each do |word|
#   puts "#{keyword} ー #{word.inner_text}"

#   @new_link = "https://ja.wikipedia.org/#{word.attribute('href').value}"
# end

puts "#{first_keyword} ー #{second_link.first.inner_text}"

new_link = "https://ja.wikipedia.org/#{second_link.attribute('href').value}"



# 2周目

url = new_link
# 取れてきてるか確認
# puts url

charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

# htmlをパースしてオブジェクトを作成
document = Nokogiri::HTML.parse(html, nil, charset)

# 最初のpタグを抽出し、その中のaタグを出力
third_link = document.xpath('//div[@class="mw-parser-output"]/p').first.xpath('.//a')

puts "#{first_keyword} - #{second_link.first.inner_text} - #{third_link.first.inner_text}"