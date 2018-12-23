# encoding: utf-8
#
# Программа «Прогноз погоды» Версия 1.2, с прогнозом погоды на неделю
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

require 'net/http'
require 'rexml/document'

require_relative 'lib/meteoservice_forecast'

# Словарик городов, собранных с сайта Метеосервиса. Можно написать код, который
# будет собирать все города и их названия с сайта амтоматически, но мы пока
# этого делать не будем. При необходимости добавляйте свои города руками.
CITIES = {
  37 => 'Москва',
  69 => 'Санкт-Петербург',
  99 => 'Новосибирск',
  59 => 'Пермь',
  115 => 'Орел',
  121 => 'Чита',
  141 => 'Братск',
  199 => 'Краснодар'
}.invert.freeze

# Сделаем массив из наваний городов, взяв ключи массива CITIES
city_names = CITIES.keys

# Спрашиваем у пользователя, какой город по порядку ему нужен
puts 'Погоду для какого города Вы хотите узнать?'
city_names.each_with_index { |name, index| puts "#{index + 1}: #{name}" }
city_index = gets.to_i
unless city_index.between?(1, city_names.size)
  city_index = gets.to_i
  puts "Введите число от 1 до #{city_names.size}"
end

# Когда, наконец, получим нуный индекс, достаем city_id
city_id = CITIES[city_names[city_index - 1]]

# Сформировали адрес запроса
url = "http://xml.meteoservice.ru/export/gismeteo/point/#{city_id}.xml"

# Дальше все по старому
response = Net::HTTP.get_response(URI.parse(url))
doc = REXML::Document.new(response.body)

city_name = URI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])

forecast_nodes = doc.root.elements['REPORT/TOWN'].elements.to_a

puts city_name
puts

forecast_nodes.each do |node|
  puts MeteoserviceForecast.from_xml(node)
  puts
end
