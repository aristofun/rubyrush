# encoding: utf-8
#
# Тестовый сценарий для Склонятора на базе RSpec
#
# (с) rubyrush.ru

# Подключаем библиотеку rspec для тестирования
require 'rspec'

# Подключаем наш класс Склонятор
require_relative 'sklonjator.rb'

# Cценарий для конкретного класса/модуля/метода в RSpec всегда начинается со
# слова «describe»
describe Sklonjator do
  # Внутри describe идет набор кейсов, каждый внутри своего it:
  #
  # it '...' do
  #   ...
  # end
  #
  # Каждый такой кейс выполняется rspec-ом при запуске всего набора тестов в
  # случайном порядке. Поэтому тесты надо писатьтак, чтобы отдельный it-ы друг
  # от друга не зависили.

  # Сначала проверим метод на вывод третей формы слова («7 крокодилов»)
  it 'returns KROKODILOV' do
    # С помощью конструкции expect(...).to ... можно проверить, что первое
    # выражение удовлетворяет требования после to. Если грубо перевести на
    # русский, то получится что-то вроде:
    #
    # ожидаем_что(это).to будет(вот_таким)
    #
    # Самый простой случай — равенство. Проверить, что что-то равно чему-то
    # можно с помощью метода «eq» (от слова equal — равно).
    expect(
      Sklonjator.sklonenie(0, 'krokodil', 'krokodila', 'krokodilov')
    ).to eq 'krokodilov'

    expect(
      Sklonjator.sklonenie(5, 'krokodil', 'krokodila', 'krokodilov')
    ).to eq 'krokodilov'

    expect(
      Sklonjator.sklonenie(6, 'krokodil', 'krokodila', 'krokodilov')
    ).to eq 'krokodilov'
    # Обо всех возможностях RSpec см. документацию и материалы к уроку
  end

  # В следующем примере мы прогоним сразу несколько вариантов чисел,
  # соответствующих формы слова «крокодилов»
  it 'returns KROKODILOV (automated)' do
    # Для каждого числа из массива чисел
    [5, 6, 7, 8, 9, 0].each do |number|
      # Пройдем от 1 до 100 c шагом 10
      (0..100).step(10) do |i|
        # И вычислим сумму первого числа и счетчика
        summa = i + number
        expect(
          summa.to_s + ' ' +
          Sklonjator.sklonenie(summa, 'krokodil', 'krokodila', 'krokodilov')
        ).to eq "#{summa} krokodilov"
      end
    end
  end

  # Простые случаи для формы слова «крокодил»
  it 'returns KROKODIL' do
    [1, 21, 31, 141].each do |number|
      expect(
        number.to_s + ' ' +
        Sklonjator.sklonenie(number, 'krokodil', 'krokodila', 'krokodilov')
      ).to eq "#{number} krokodil"
    end
  end

  # Простые случаи для формы слова «крокодила»
  it 'returns KROKODILA' do
    [2, 3, 4, 22, 33, 144].each do |number|
      expect(
        number.to_s + ' ' +
        Sklonjator.sklonenie(number, 'krokodil', 'krokodila', 'krokodilov')
      ).to eq "#{number} krokodila"
    end
  end

  # Особые случаи: этот тест должен упасть. Чтобы он заработал, надо починить
  # склонятор (см. исходник склонятора).
  it 'returns KROKODILOV (special)' do
    [10, 11, 12, 13, 14, 111, 312, 1013, 2414].each do |number|
      expect(
        number.to_s + ' ' +
        Sklonjator.sklonenie(number, 'krokodil', 'krokodila', 'krokodilov')
      ).to eq "#{number} krokodilov"
    end
  end
end
