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
require 'json'

require_relative 'lib/meteoservice_forecast'
require_relative 'data/cities.json'

# Прочитаем файл с городами и их индексами(https://www.meteoservice.ru/content/export.html)
# И запишем данные в cities
file = File.read("#{__dir__}/data/cities.json", encoding: 'utf-8')
cities = JSON.parse(file)

# Спрашиваем у пользователя, какой город по порядку ему нужен
puts 'Погоду для какого города Вы хотите узнать?'
cities.each_with_index do |name,index|
  puts "#{index+1}: #{name.first}"
end

city_index = gets.chomp.to_i
# Пока пользователь не введет число между 1 и 8 (в нашем случае)
# програма будет уведомлять об не правильном вводе и просить ввести число снова
until city_index.between?(1, cities.size)
  puts "Неверный выбор!"
  puts "Пожалуйста введите число от 1 до #{cities.size}"
  city_index = gets.chomp.to_i
end

# Когда, наконец, получим нуный индекс, достаем city_id
city_id = cities[cities[city_index - 1]]

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
