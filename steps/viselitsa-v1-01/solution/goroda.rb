# encoding: utf-8

# Подключаем методы городов из соответствующих файлов. Обратите внимание, что мы
# используем для этого не require, а require_relative. В отличие от require этот
# метод ищет файлы .rb (расширение можно не указывать) в той же папке, где лежит
# сама программа.
require_relative 'london'
require_relative 'paris'
require_relative 'rome'

# Вызываем методы, определенные в каждом из файлов
visit_london
visit_paris
visit_rome
