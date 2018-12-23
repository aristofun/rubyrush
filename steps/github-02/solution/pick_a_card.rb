# encoding: utf-8
#
# Программа, которая выбирает произвольную карту игральной колоды, версия 2.
# Масти — юникод-символы.
#
# (с) rubyrush.ru

# Этот код необходим только при использовании unicode-символов на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

# Создадим массив с набором мастей, вместо названия масти — иконка-символ
suits = ['♦', '♠', '♥ ', '♣']

puts "#{values.sample}#{suits.sample}"
