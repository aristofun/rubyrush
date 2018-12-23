# encoding: utf-8
#
# Тестовый сценарий для Склонятора на базе RSpec
#
# (с) rubyrush.ru
require 'rspec'
require_relative 'sklonjator.rb'

describe Sklonjator do
  it 'returns KROKODILOV' do
    expect(
      Sklonjator.sklonenie(0, 'krokodil', 'krokodila', 'krokodilov')
    ).to eq 'krokodilov'

    expect(
      Sklonjator.sklonenie(5, 'krokodil', 'krokodila', 'krokodilov')
    ).to eq 'krokodilov'

    expect(
      Sklonjator.sklonenie(6, 'krokodil', 'krokodila', 'krokodilov')
    ).to eq 'krokodilov'
  end

  it 'returns KROKODILOV (automated)' do
    [5, 6, 7, 8, 9, 0].each do |number|
      (0..100).step(10) do |i|
        summa = i + number
        expect(
          summa.to_s + ' ' +
          Sklonjator.sklonenie(summa, 'krokodil', 'krokodila', 'krokodilov')
        ).to eq "#{summa} krokodilov"
      end
    end
  end

  it 'returns KROKODIL' do
    [1, 21, 31, 141].each do |number|
      expect(
        number.to_s + ' ' +
        Sklonjator.sklonenie(number, 'krokodil', 'krokodila', 'krokodilov')
      ).to eq "#{number} krokodil"
    end
  end

  it 'returns KROKODILA' do
    [2, 3, 4, 22, 33, 144].each do |number|
      expect(
        number.to_s + ' ' +
        Sklonjator.sklonenie(number, 'krokodil', 'krokodila', 'krokodilov')
      ).to eq "#{number} krokodila"
    end
  end

  it 'returns KROKODILOV (special)' do
    [10, 11, 12, 13, 14, 111, 312, 1013, 2414].each do |number|
      expect(
        number.to_s + ' ' +
        Sklonjator.sklonenie(number, 'krokodil', 'krokodila', 'krokodilov')
      ).to eq "#{number} krokodilov"
    end
  end
end
