# encoding: utf-8
#
# Программа «Прогноз погоды» Версия 1.0
#
# Данные берем из XML метеосервиса
# http://www.meteoservice.ru/content/export.html
#
# (с) rubyrush.ru и Александр Кузьмин

# Подключаем библиотеку для работы c адресами URI
require 'uri'

# Подключаем библиотеку для загрузки данных по http-протоколу
require 'net/http'

# Подключаем библиотеку для парсинга XML
require 'rexml/document'

# Для руби 3.0.0 используем библиотеку CGI
require 'cgi'

# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Массив строк для облачности, описанный на сайте метеосервиса
CLOUDINESS = %w(Ясно Малооблачно Облачно Пасмурно).freeze

# Сформируем адрес запроса с сайта метеосервиса
#
# 37 - Москва, адрес для своего города можно получить здесь:
#
# http://www.meteoservice.ru/content/export.html
uri = URI.parse('https://xml.meteoservice.ru/export/gismeteo/point/37.xml')

# Отправляем HTTP-запрос по указанному адресу и записываем ответ в переменную
# response.
response = Net::HTTP.get_response(uri)

# Из тела ответа (body) формируем XML документ с помощью REXML парсера
doc = REXML::Document.new(response.body)

# Получаем имя города из XML, город лежит в ноде REPORT/TOWN
begin
  city_name = URI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])
rescue NoMethodError
  # Для ruby версии 3.0.0 используем этот код:
  city_name = CGI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])
end

# Достаем первый XML тэг из списка <FORECAST> внутри <TOWN> — прогноз на
# ближайшее время со всей нужной нам информацией.
forecast = doc.root.elements['REPORT/TOWN/FORECAST']

# Записываем минимальное и максимальное значение температуры из аттрибутов min
# и max вложенного в элемент FORECAST тэга TEMPERATURE
min_temp = forecast.elements['TEMPERATURE'].attributes['min']
max_temp = forecast.elements['TEMPERATURE'].attributes['max']

# Записываем максимальную скорость ветра из атриубута max тэга WIND
max_wind = forecast.elements['WIND'].attributes['max']

# Достаем из тега PHENOMENA атрибут cloudiness и по его значению находим строку
# с обозначением облачности из массива CLOUDINESS
clouds_index = forecast.elements['PHENOMENA'].attributes['cloudiness'].to_i
clouds = CLOUDINESS[clouds_index]

# Выводим всю информацию на экран
puts city_name
puts "Температура — от #{min_temp} до #{max_temp} С"
puts "Ветер #{max_wind} м/с"
puts clouds
