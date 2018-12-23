# encoding: utf-8
#
# Программа «Обмен валюты», которая достает данные о текущем курсе по сети
#
# (с) rubyrush.ru
#
# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем нужные библиотеки
require 'net/http'
require 'rexml/document'

URL = 'http://www.cbr.ru/scripts/XML_daily.asp'

# Достаем данные с сайта Центробанка и записываем их в XML
response = Net::HTTP.get_response(URI.parse(URL))
doc = REXML::Document.new(response.body)

# Для того, чтобы найти курс валюты, необходимо знать её ID в XML-файле
#
# R01235 — Доллар США
# R01239 — Евро

# Найдём в документе соответствующие элементы
doc.each_element('//Valute[@ID="R01235" or @ID="R01239"]') do |currency_tag|
  # Достаём название валюты и курс
  name = currency_tag.get_text('Name')
  value = currency_tag.get_text('Value')

  # Аккуратно выводим пользователю
  puts "#{name}: #{value} руб."
end
